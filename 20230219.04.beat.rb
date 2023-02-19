
t = 0.5

snare = :elec_snare
kick = :elec_soft_kick
hihato = :elec_triangle
hihatc = :elec_triangle
melody_synth = :tb303

live_loop :tick do
  sleep 4*t
end

live_loop :drums do
  sync :tick
  
  sample kick
  sleep t
  
  sample snare
  sleep t
  
  sample kick
  sleep t
  
  sample snare
end

live_loop :hihat do
  with_fx :echo do
    sync :tick
    sample :elec_triangle, amp: rrand(0, 1), sustain: 0, release: 4*t
    sleep 3*t
  end
end

live_loop :melody do
  use_synth melody_synth
  sync :tick
  play (chord :A3, :minor).choose, release: 2*t, amp: 0.5, cutoff: rrand(60, 120)
  sleep t
  play (chord :A4, :minor).choose, release: 2*t, amp: 0.5, cutoff: rrand(60, 120)
  sleep t
  play (chord :A3, :minor).choose, release: 2*t, amp: 0.5, cutoff: rrand(60, 120)
  sleep t
  play (chord :A4, :minor).choose, release: 2*t, amp: 0.5, cutoff: rrand(60, 120)
end
