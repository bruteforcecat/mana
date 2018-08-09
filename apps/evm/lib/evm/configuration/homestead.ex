defmodule EVM.Configuration.Homestead do
  defstruct contract_creation_cost: 53_000,
            has_delegate_call: true,
            fail_contract_creation: true,
            fallback_config: EVM.Configuration.Frontier.new()

  def new do
    %__MODULE__{}
  end
end

defimpl EVM.Configuration, for: EVM.Configuration.Homestead do
  @spec contract_creation_cost(EVM.Configuration.t()) :: integer()
  def contract_creation_cost(config), do: config.contract_creation_cost

  @spec has_delegate_call?(EVM.Configuration.t()) :: boolean()
  def has_delegate_call?(config), do: config.has_delegate_call

  @spec fail_contract_creation_lack_of_gas?(EVM.Configuration.t()) :: boolean()
  def fail_contract_creation_lack_of_gas?(config), do: config.fail_contract_creation

  @spec extcodesize_cost(EVM.Configuration.t()) :: integer()
  def extcodesize_cost(config), do: config.fallback_config.extcodesize_cost

  @spec extcodecopy_cost(EVM.Configuration.t()) :: integer()
  def extcodecopy_cost(config), do: config.fallback_config.extcodecopy_cost

  @spec balance_cost(EVM.Configuration.t()) :: integer()
  def balance_cost(config), do: config.fallback_config.balance_cost

  @spec sload_cost(EVM.Configuration.t()) :: integer()
  def sload_cost(config), do: config.fallback_config.sload_cost

  @spec call_cost(EVM.Configuration.t()) :: integer()
  def call_cost(config), do: config.fallback_config.call_cost

  @spec selfdestruct_cost(EVM.Configuration.t(), keyword()) :: integer()
  def selfdestruct_cost(config, _params), do: config.fallback_config.selfdestruct_cost

  @spec fail_nested_operation_lack_of_gas?(EVM.Configuration.t()) :: boolean()
  def fail_nested_operation_lack_of_gas?(config), do: config.fallback_config.fail_nested_operation
end