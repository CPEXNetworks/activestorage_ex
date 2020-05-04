defmodule ActivestorageExTest.BlobTest do
  use ExUnit.Case

  alias ActivestorageEx.Blob
  alias ActivestorageEx.Activestorage.BlobStats

  @image_filepath "test/files/image.jpg"

  describe "analyze!/1" do
    test "Returns %BlobStats{}" do
      assert %BlobStats{} = Blob.analyze!(@image_filepath)
    end

    test "Returns blob size on disk" do
      known_byte_size = 156_746

      assert %{byte_size: ^known_byte_size} = Blob.analyze!(@image_filepath)
    end

    test "Returns blob checksum" do
      known_checksum = "o0K/S+b6DobHNNfe6EGCKA=="

      assert %{checksum: ^known_checksum} = Blob.analyze!(@image_filepath)
    end

    test "Returns blob content_type" do
      known_content_type = "image/jpeg"

      assert %{content_type: ^known_content_type} = Blob.analyze!(@image_filepath)
    end

    test "Returns blob filename" do
      known_filename = "image"

      assert %{filename: ^known_filename} = Blob.analyze!(@image_filepath)
    end

    test "Returns blob metadata" do
      known_metadata = %{
        identified: true,
        analyzed: true,
        height: 720,
        width: 1080
      }

      assert %{metadata: ^known_metadata} = Blob.analyze!(@image_filepath)
    end
  end
end
