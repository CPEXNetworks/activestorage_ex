defmodule ActivestorageEx.Blob do
  alias ActivestorageEx.Activestorage.BlobStats

  @enforce_keys [:key, :content_type, :filename]
  defstruct key: nil,
            content_type: nil,
            filename: nil

  def analyze!(image_path) do
    image =
      image_path
      |> Mogrify.open()
      |> Mogrify.verbose()

    %BlobStats{
      content_type: "image/#{image.format}",
      byte_size: size_on_disk(image.path),
      filename: filename(image),
      checksum: compute_checksum!(image.path),
      metadata: %{
        identified: true,
        analyzed: true,
        height: image.height,
        width: image.width
      }
    }
  end

  defp size_on_disk(image_path) do
    %{size: size} = File.stat!(image_path)

    size
  end

  defp filename(image) do
    Path.basename(image.path, image.ext)
  end

  defp compute_checksum!(image_path) do
    File.stream!(image_path, [], 2048)
    |> Enum.reduce(:crypto.hash_init(:md5), fn (line, acc) -> :crypto.hash_update(acc, line) end)
    |> :crypto.hash_final
    |> Base.encode64
  end
end
