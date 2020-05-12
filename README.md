# Reusable

Provides a more type-safe way of registering and dequeuing table/collection view cells.

## Usage

Have your table or collection view cell class conform to `Reusable`.

```swift
class ExampleCell: UITableViewCell, Reusable {

    func configure(...) { ... }
}
```

If your cell uses a NIB for its UI, then conform to `NibReusable`.

```swift
class ExampleCell: UITableViewCell, NibReusable {

    func configure(...) { ... }
}
```

Use the register extension methods to register your cell classes with your table/collection view.

```swift
ExampleCell.registerReusableCell(for: tableView)
```

Use the dequeue extension methods to dequeue cells in your data source.

```swift
let cell = ExampleCell.dequeueReusableCell(for: tableView, at: indexPath)
cell.configure(...)

return cell
```

The cell instance is already of the correct type so there's no need to cast it in your data source.
