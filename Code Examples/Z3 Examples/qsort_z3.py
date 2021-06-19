#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
import os
import sys
import random
import math
import json
import z3

pivot_vector_choices = []
prob_vector = []


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


def partition_quicksort(
    solver, arr, temp_arr, start, end, pivot_vector, compare_vector
):

    compare = 0
    range_iter = (end - start) + 1
    prob_value = 1 / range_iter

    prob_vector.append(prob_value)

    pivot = z3.Int("pivot")
    solver.add(z3.Or([pivot == temp_arr[i + start]
               for i in range(range_iter)]))

    if len(pivot_vector_choices) >= 1:
        pivot_choices = pivot_vector_choices[-1]
        solver.add(
            z3.Or([pivot != pivot_choices[i]
                  for i in range(len(pivot_choices))])
        )

    solver.check()
    model = solver.model()
    index_pivot = find_index_pivot(temp_arr, get_value(model[pivot]))

    # index_pivot = random.randint(start, end)
    temp_arr = swap(temp_arr, index_pivot, end)

    i = start - 1
    pivot_value = temp_arr[end]

    j = start
    iterator = 0
    while j <= end - 1:
        compare += 1
        if temp_arr[j] <= pivot_value:
            i += 1
            temp_arr = swap(temp_arr, i, j)
        j += 1
        iterator += 1

    temp_arr = swap(temp_arr, i + 1, end)
    ypvot = i + 1

    pivot_choice = index_pivot

    pivot_vector.append(pivot_choice)
    compare_vector.append(compare)

    return ypvot


def quicksort_z3(solver, arr, temp_arr, start, end, pivot_vector, compare_vector):
    if start < end:
        solver.push()
        pivot_index_sort = partition_quicksort(
            solver, arr, temp_arr, start, end, pivot_vector, compare_vector
        )
        solver.pop()
        # print(f"Start: {start}, End: {end}, Pivot Index: {pivot_index_sort}")
        quicksort_z3(
            solver,
            arr,
            temp_arr,
            start,
            pivot_index_sort - 1,
            pivot_vector,
            compare_vector,
        )
        quicksort_z3(
            solver,
            arr,
            temp_arr,
            pivot_index_sort + 1,
            end,
            pivot_vector,
            compare_vector,
        )


def run_sort_concrete(solver, arr):
    pivot_vector = []
    compare_vector = []

    solver.push()
    z3.set_param("smt.random_seed", int(time.time()))

    # solver.add(arr[0] == 4)
    # solver.add(arr[1] == 12)
    # solver.add(arr[2] == 5)
    # solver.add(arr[3] == 11)
    # solver.add(arr[4] == 16)
    # solver.add(arr[5] == 3)
    # solver.add(arr[6] == 0)
    # solver.add(arr[7] == 5)
    # solver.add(arr[8] == 18)
    # solver.add(arr[9] == 1)

    # range_constraint = [z3.And(arr[i] > 1, arr[i] < 1000000)
    #                     for i in range(forall_elems)]

    # solver.add(range_constraint)
    solver.add(z3.Distinct(arr))

    solver.check()
    init_model = solver.model()
    temp_arr = [get_value(init_model[arr[i]]) for i in range(len(arr))]
    solver.pop()

    quicksort_z3(solver, arr, temp_arr, 0, len(
        arr) - 1, pivot_vector, compare_vector)

    # print(temp_arr)
    return temp_arr, pivot_vector, compare_vector


model_count = 1000
forall_elems = 10
expvalues = []
runs_w_i = []

compare_vector_run = []
sigma_w_i = []

model_count_values = [100, 500, 1000, 2000, 3000, 4000, 5000,
                      6000, 7000, 8000, 9000, 10000, 11000, 12000, 13500, 15000]

if __name__ == "__main__":

    z3.set_param("smt.random_seed", int(time.time()))
    solver = z3.Solver()
    arr = [z3.Int(f"arr_{i}") for i in range(forall_elems)]

    for values in model_count_values:
        models = values
        while models > 0:
            temp_arr, pivot_vector, compare_vector = run_sort_concrete(
                solver, arr)

            w_i = math.prod(prob_vector)
            sigma_w_i.append(w_i)

            prob_vector = []
            pivot_vector_choices.append(pivot_vector)
            compare_vector_run.append(compare_vector)

            models -= 1

        print(f"sigma_w_i = {sum(sigma_w_i)}")
        print(
            f"E[compare] = {sum([sigma_w_i[i] * sum(compare_vector_run[i]) for i in range(values)])}"
        )

        runs_w_i.append(sum(sigma_w_i))
        expvalues.append(sum([sigma_w_i[i] * sum(compare_vector_run[i])
                              for i in range(values)]))

        compare_vector_run = []
        sigma_w_i = []

    print(runs_w_i)
    print(expvalues)
