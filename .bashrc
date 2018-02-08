# Infinite bash command history:
# Don't forget to mkdir ~/hist before starting to use this.
export PROMPT_COMMAND="history 1 >> ~/hist/$(date +%Y%m%d)"
