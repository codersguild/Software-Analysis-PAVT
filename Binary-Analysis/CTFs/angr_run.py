# More on Angr : https://docs.angr.io/
import angr

# Pass the path to the binary.
proj = angr.Project("./buggy", auto_load_libs=False)
state = proj.factory.entry_state()
simgr = proj.factory.simgr(state)

print(simgr.active)
simgr.step()
print(simgr.active)

while len(simgr.active) == 1:
  simgr.step()
  print(simgr.active)
