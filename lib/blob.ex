defmodule ActivestorageEx.Blob do
  @enforce_keys [:key, :content_type, :filename]
  defstruct key: nil,
            content_type: nil,
            filename: nil,
            checksum: nil

  @doc """
    Returns a string checksum from a given image path

  ## Parameters
    - `image_path`: A `String.t()` path to the image on disk
  """
  @spec compute_checksum!(String.t()) :: String.t()
  def compute_checksum!(image_path) do
    File.stream!(image_path, [], 2048)
    |> Enum.reduce(:crypto.hash_init(:md5), fn (line, acc) -> :crypto.hash_update(acc, line) end)
    |> :crypto.hash_final
    |> Base.encode64
  end
end
