defmodule ActivestorageExTest.BlobTest do
  use ExUnit.Case

  alias ActivestorageEx.Blob

  @image_filepath "test/files/image.jpg"

  describe "compute_checksum!/1" do
    test "Computes checksum from filepath" do
      result = Blob.compute_checksum!(@image_filepath)

      assert String.length(result) > 0
    end

    test "Computes same checksum each time" do
      result_1 = Blob.compute_checksum!(@image_filepath)
      result_2 = Blob.compute_checksum!(@image_filepath)

      assert result_1 == result_2
    end
  end
end
