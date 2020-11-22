append_new([], L, L).
append_new([X|L1], L2, [X|L3]):- append_new(L1, L2, L3).