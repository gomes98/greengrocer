import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;
import 'package:greengrocer/src/pages/orders/controllers/all_orders_controller.dart';
import 'package:greengrocer/src/pages/orders/views/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: GetBuilder<AllOrdersController>(
        builder: (controller) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) =>
                OrderTile(order: controller.allOrders[index]),
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            itemCount: controller.allOrders.length,
          );
        },
      ),
    );
  }
}
