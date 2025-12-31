import 'package:get/get.dart';

import '../../../../../images.dart';

class BasicController extends GetxController {
  final List<StripedData> striped = <StripedData>[
    StripedData('John A. Miller', 'AC415 987 6543', 'March 14, 1980', Images.avatars[0]),
    StripedData('Sophia T. Walker', 'SB702 123 9876', 'October 22, 1975', Images.avatars[1]),
    StripedData('Michael P. Johnson', 'DL212 555 8765', 'February 11, 1967', Images.avatars[2]),
    StripedData('Olivia R. Davis', 'CA323 444 2109', 'June 19, 1992', Images.avatars[3]),
  ];

  final List<TableHeadData> tableHead = <TableHeadData>[
    TableHeadData('Slim Fit Jeans', 'UPS', 120, 'Delivered'),
    TableHeadData('Casual Polo Shirt', 'USPS', 75, 'Shipped'),
    TableHeadData('Graphic Hoodie', 'DHL', 40, 'Order Received'),
    TableHeadData('Rainproof Jacket', 'FedEx', 95, 'Delivered'),
    TableHeadData('Sport Shorts & Tee', 'UPS', 15, 'Payment Failed'),
  ];

  final List<SmallTableData> smallTableData = <SmallTableData>[
    SmallTableData('Slim Fit Jeans', 89.99, 120, 10798.80),
    SmallTableData('Casual Polo Shirt', 45.75, 85, 3898.75),
    SmallTableData('Graphic Hoodie', 55.00, 48, 2640.00),
    SmallTableData('Rainproof Jacket', 99.99, 110, 10998.90),
    SmallTableData('Sport Shorts & Tee', 29.99, 40, 1199.60),
  ];
}

class StripedData {
  final String name;
  final String accountNo;
  final String balance;
  final String imagePath;

  StripedData(this.name, this.accountNo, this.balance, this.imagePath);
}

class TableHeadData {
  final String product;
  final String courier;
  final double progress;
  final String status;

  TableHeadData(this.product, this.courier, this.progress, this.status);
}

class SmallTableData {
  final String product;
  final double price;
  final int quantity;
  final double amount;

  SmallTableData(this.product, this.price, this.quantity, this.amount);
}
