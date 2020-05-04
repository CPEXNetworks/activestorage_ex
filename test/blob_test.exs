defmodule ActivestorageExTest.BlobTest do
  use ExUnit.Case

  alias ActivestorageEx.Blob

  @image_filepath "test/files/image.jpg"

  describe "compute_checksum!/1" do
    test "Computes checksum from filepath" do
      known_checksum = "o0K/S+b6DobHNNfe6EGCKA=="

      assert ^known_checksum = Blob.compute_checksum!(@image_filepath)
    end
  end
end
