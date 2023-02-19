
t = 0.5

live_loop :tick do
  set_mixer_control! lpf_slide: 4*t, lpf: rrand(40, 100)
  sleep 4*t
end

live_loop :drums do
  sync :tick
  snare = :elec_snare
  kick = :elec_soft_kick
  
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
    sample :elec_triangle, release: 4*t  if one_in(4)
    sleep 3*t
  end
end

live_loop :melody do
  use_synth :tb303
  sync :tick
  play (chord :A3, :minor).choose, release: 2*t, amp: 0.5, cutoff: rrand(60, 120)
  sleep t
  play (chord :A4, :minor).choose, release: 2*t, amp: 0.5, cutoff: rrand(60, 120)
  sleep t
  play (chord :A3, :minor).choose, release: 2*t, amp: 0.5, cutoff: rrand(60, 120)
  sleep t
  play (chord :A4, :minor).choose, release: 2*t, amp: 0.5, cutoff: rrand(60, 120)
end
