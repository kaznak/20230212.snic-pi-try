
t = 0.5

snare = :elec_snare
kick = :elec_soft_kick
hihato = :elec_hi_snare
hihatc = :elec_lo_snare
melody_synth = :prophet

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
  sleep t/2
  sample kick, amp: 0.5
  sleep t/2
  
  sample snare
end

live_loop :hihat do
  
  sync :tick
  
  3.times do
    sample hihatc, amp: 0.3, sustain: 0, release: t/2
    sleep t/2
    sample hihato, amp: 0.3, sustain: 0, release: t/2
    sleep t/2
  end
  
  sample hihatc, amp: 0.3, sustain: 0, release: t/2
  sleep t/2
  sample hihato, amp: 0.3, sustain: 0, release: t/2
end

live_loop :melody do
  use_synth melody_synth
  sync :tick
  play (chord :C3, :major).choose, release: 3*t
  sleep t
  play (chord :C4, :major).choose, release: 3*t
  sleep 3*t
end
