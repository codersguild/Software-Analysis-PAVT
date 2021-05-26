# This file has a bug? Can you figure it out? Hint : Recursion Limits

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
import os
import sys
import random
import json
import z3


def num(r):
    """
    Convert from Z3 to python float values.
    """
    return float(r.numerator_as_long()) / float(r.denominator_as_long())


def get_value(r):
    # https://stackoverflow.com/questions/12598408/z3-python-getting-python-values-from-model/12600208
    """
    Convert from Z3 to python values.
    """
    if z3.is_true(r):
        return z3.is_true(r)
    elif z3.is_false(r):
        return z3.is_false(r)
    elif z3.is_int_value(r):
        return r.as_long()
    elif z3.is_algebraic_value(r):
        return round(num(r.approx(15)), 10)
    elif z3.is_rational_value(r):
        return r.as_decimal(20)
    elif r is None:
        None
    else:
        return num(r)


def swap(arr, x1, x2):
    arr[x1], arr[x2] = arr[x2], arr[x1]
    return arr


def find_index_pivot(arr, elem):
    for index, item in enumerate(arr):
        if elem == item:
            return index


def partition_routine(solver, arr, left, right, pivot):

    print(left)
    print(right)

    if left == right:
        pass

    range_iter = right - left

    if range_iter < 0:
        return

    left_sum = z3.Int("left_sum")
    right_sum = z3.Int("right_sum")
    left_count = [z3.Int(f"left_{i}") for i in range(range_iter)]
    right_count = [z3.Int(f"right_{i}") for i in range(range_iter)]

    solver.add(z3.Or([pivot == arr[i + left] for i in range(range_iter)]))

    for i in range(range_iter):
        solver.add(z3.If(arr[i + left] < pivot, left_count[i]
                         == 1, left_count[i] == 0))
        solver.add(z3.If(arr[i + left] >= pivot, right_count[i]
                         == 1, right_count[i] == 0))

    solver.add(left_sum == z3.Sum(left_count))
    solver.add(right_sum == z3.Sum(right_count))

    if (solver.check() == z3.sat):
        model_before_pop = solver.model()
        temp_arr = [get_value(model_before_pop[arr[i + left]])
                    for i in range(range_iter)]

        index_pivot = find_index_pivot(
            temp_arr, get_value(model_before_pop[pivot]))
        temp_arr = swap(temp_arr, -1, index_pivot)

        i = left - 1
        for j in range(range_iter - 1):
            if (temp_arr[j + left] <= temp_arr[-1]):
                i += 1
                temp_arr = swap(temp_arr, i, j + left)

    return temp_arr, model_before_pop, left_sum, right_sum


def quicksort_z3(solver, arr, start, end):

    if start == end:
        return

    if end - start < 0:
        return

    solver.push()
    pivot = z3.Int('pivot')
    temp_arr, model_before_pop, left_sum, right_sum = partition_routine(
        solver, arr, start, end, pivot)
    solver.pop()

    solver.push()
    solver.add(z3.And([arr[i] == temp_arr[i] for i in range(len(temp_arr))]))

    if (solver.check() == z3.sat):
        m = solver.model()
        print(f"Arr : {[m[arr[i]] for i in range(forall_elems)]}")
        print(f"left : {model_before_pop[left_sum]}")
        print(f"right : {model_before_pop[right_sum]}")
        print(f"pivot : {model_before_pop[pivot]}")
    solver.pop()

    pivot_index_sort = get_value(model_before_pop[left_sum])
    print(pivot_index_sort)
    print(end)

    quicksort_z3(solver, arr, start, pivot_index_sort)
    quicksort_z3(solver, arr, pivot_index_sort + 1, end)


forall_elems = 3
if __name__ == "__main__":

    z3.set_param("smt.random_seed", int(time.time()))
    solver = z3.Solver()

    arr = [z3.Int(f"arr_{i}") for i in range(forall_elems)]
    solver.add(z3.Distinct(arr))
    solver.add(z3.And([arr[i] >= 3 for i in range(forall_elems)]))
    solver.add(z3.And([arr[i] <= 100 for i in range(forall_elems)]))

    quicksort_z3(solver, arr, 0, len(arr) - 1)
