# Dotfiles

Конфигурация рабочего окружения для macOS на Apple Silicon: Zsh, tmux, Starship и Neovim. Файлы устанавливаются через GNU Stow в домашний каталог.

## Установка с нуля

1. Установите инструменты разработчика Apple:

   ```sh
   xcode-select --install
   ```

2. Установите [Homebrew](https://brew.sh/) по инструкции на сайте и добавьте его в окружение, как указано установщиком. Затем установите программы:

   ```sh
   brew install git stow zsh tmux starship zoxide eza bat ripgrep tldr neovim zsh-autosuggestions zsh-syntax-highlighting
   ```

3. Склонируйте репозиторий:

   ```sh
   git clone https://github.com/dns-klchn0318/.dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

4. Сохраните существующие `~/.zshrc`, `~/.tmux.conf`, `~/.config/starship.toml` и `~/.config/nvim`, если они есть: Stow не перезаписывает конфликтующие файлы. Затем проверьте и установите ссылки:

   ```sh
   mkdir -p ~/.config
   stow --simulate --verbose --target="$HOME" zsh tmux starship nvim
   stow --verbose --target="$HOME" zsh tmux starship nvim
   ```

5. Откройте новый терминал или выполните `exec zsh`. При первом запуске `nvim` автоматически установит lazy.nvim и плагины; для этого нужны Git и интернет. Подробности и сочетания клавиш — в [описании Neovim](nvim/.config/nvim/README.md).

Конфигурация рассчитана на Homebrew в `/opt/homebrew` и использует системный буфер macOS в tmux. Для отображения всех значков может понадобиться шрифт с поддержкой Nerd Font. Алиасы Docker и Colima работают после отдельной установки этих программ. Необязательный `tuipo` используется для запуска Codex, только если он установлен.

## Обновление и удаление ссылок

```sh
cd ~/.dotfiles
git pull
stow --restow --target="$HOME" zsh tmux starship nvim
# Удалить только ссылки:
stow --delete --target="$HOME" zsh tmux starship nvim
```
