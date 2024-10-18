defmodule Solution do
  def has_cycle?(head) do
    detect_cycle(head, head)
  end

  defp detect_cycle(nil, _), do: false
  defp detect_cycle(_, nil), do: false
  defp detect_cycle(slow, fast) when slow == fast, do: true
  defp detect_cycle(slow, fast) do
    if fast.next && fast.next.next do
      detect_cycle(slow.next, fast.next.next)
    else
      false
    end
  end
end
