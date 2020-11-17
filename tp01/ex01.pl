% EX01 - TP01

% parent(parent, child)
parent('aldo burrows', 'lincoln burrows').
parent('aldo burrows', 'michael scofield').
parent('christina rose scofield', 'michael scofield').
parent('christina rose scofield', 'lincoln burrows').
parent('lisa rix', 'lj burrows').
parent('lincoln burrows', 'lj burrows').
parent('michael scofield', 'ella scofield').
parent('sara tancredi', 'ella scofield').

male('aldo burrows').
male('lincoln burrows').
male('michael scofield').
male('lj burrows').

female('lisa rix').
female('christina rose scofield').
female('sara tancredi').
female('ella scofield').

% Micheal Scofield's Parents -> ?- parent(X, 'michael scofield')
% Aldo Burrows' Children -> ?- parent('aldo burrows', X)
