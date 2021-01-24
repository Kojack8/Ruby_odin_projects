module Find
  def find(key, root = @root, parent = nil)
    location = []
    location.push(root)
    location.push(parent)
    return location if root.nil? || root.data == key

    parent = root
    if root.data < key
      find(key, root.right, parent)
    else
      find(key, root.left, parent)
    end
  end
end