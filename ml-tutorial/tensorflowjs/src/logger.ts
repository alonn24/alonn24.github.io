export function overrideConsole(container) {
  const log = document.querySelector(`${container}`)
  const form = document.getElementById('console') as HTMLFormElement
  const input = document.getElementById('console-input') as HTMLInputElement

  form.addEventListener('submit', function(event) {
    event.preventDefault();
    console.log(eval(input.value))
  })

  const verbs = ['log', 'warn', 'error']
  verbs.forEach(verb => {
    const real = console[verb].bind(console)
    console[verb] = function overrideConsole(...args) {
      real(...args)
      const msg = document.createElement('div')
      // msg.classList.add(verb)
      msg.textContent = verb + ': ' + args.join('\n')
      log.insertBefore(msg, form)
    }
  })
}