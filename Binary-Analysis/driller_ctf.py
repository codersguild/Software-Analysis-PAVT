import driller

d = driller.Driller("./buggy",  # path to the target binary
                    b"init", # initial testcase
                    b"\xff" * 65535, # AFL bitmap with no discovered transitions
                   )

new_inputs = d.drill()
