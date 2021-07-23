# Angr & QEMU Tracer Example
# https://docs.angr.io/
# QEMU Tracer https://github.com/angr/tracer
import angr
import tracer

r = tracer.qemu_runner.QEMURunner("./buggy", b"init")
p = angr.Project("./buggy")

s = p.factory.full_init_state(stdin=angr.SimFileStream, mode='tracing')
simgr = p.factory.simgr(s)

t = angr.exploration_techniques.Tracer(trace=r.trace, crash_addr=r.crash_addr, copy_states=True, follow_unsat=True)
core = angr.exploration_techniques.DrillerCore(trace=r.trace, fuzz_bitmap=b"\xff" * 65535)

# Gives the following error : https://github.com/shellphish/driller/issues/81
# simgr.use_technique(t)
simgr.use_technique(angr.exploration_techniques.Oppologist())
simgr.use_technique(core)

while simgr.active and len(simgr.active) < len(r.trace) - 1:
    simgr.step()
    print(simgr.active)
