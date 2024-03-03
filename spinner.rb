require 'tty-spinner'

spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :pulse_2)

spinner.auto_spin

sleep(3)

spinner.success("Done!")
