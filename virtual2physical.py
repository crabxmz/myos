vaddr=0xc0100000
ptd_offset=vaddr>>22
pte_offset=(vaddr>>12) & 0x3ff
pf_offset=vaddr & 0xfff
print(f"ptd_offset={hex(ptd_offset)}")
print(f"pte_offset={hex(pte_offset)}")
print(f"pf_offset={hex(pf_offset)}")