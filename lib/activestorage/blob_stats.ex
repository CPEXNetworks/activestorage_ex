defmodule ActivestorageEx.Activestorage.BlobStats do
  @moduledoc ~S"""
  Interop with ActiveStorage requires data be a specific shape before persistence.

  This module simply contains a struct that represents how AS expects blob stats (not generated attributes like `key`)
  to look before inserting in the database.

  There is some overlap with %ActivestorageEx.Blob{} but that is our internal representation, this is ActiveStorage's.
  This is not used interally and is only to ensure shape on the way out
  """

  @enforce_keys [:filename, :content_type, :metadata, :checksum, :byte_size]
  defstruct filename: nil,
            content_type: nil,
            metadata: nil,
            checksum: nil,
            byte_size: nil
end
