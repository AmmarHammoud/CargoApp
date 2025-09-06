enum ShipmentStatus {
  pending,
  offeredPickupDriver,
  pickedUp,
  inTransitBetweenCenters,
  arrivedAtDestinationCenter,
  offeredDeliveryDriver,
  outForDelivery,
  delivered,
  cancelled;

  const ShipmentStatus();

  factory ShipmentStatus.fromBackendStatus(String status) {
    switch (status) {
      case 'pending':
        return ShipmentStatus.pending;
      case 'offered_pickup_driver':
        return ShipmentStatus.offeredPickupDriver;
      case 'picked_up':
        return ShipmentStatus.pickedUp;
      case 'in_transit_between_centers':
        return ShipmentStatus.inTransitBetweenCenters;
      case 'arrived_at_destination_center':
        return ShipmentStatus.arrivedAtDestinationCenter;
      case 'offered_delivery_driver':
        return ShipmentStatus.offeredDeliveryDriver;
      case 'out_for_delivery':
        return ShipmentStatus.outForDelivery;
      case 'delivered':
        return ShipmentStatus.delivered;
      case 'cancelled':
        return ShipmentStatus.cancelled;
      default:
        return ShipmentStatus.pending;
    }
  }

  String toJson() {
    switch (this) {
      case ShipmentStatus.pending:
        return 'pending';
      case ShipmentStatus.offeredPickupDriver:
        return 'offered_pickup_driver';
      case ShipmentStatus.pickedUp:
        return 'picked_up';
      case ShipmentStatus.inTransitBetweenCenters:
        return 'in_transit_between_centers';
      case ShipmentStatus.arrivedAtDestinationCenter:
        return 'arrived_at_destination_center';
      case ShipmentStatus.offeredDeliveryDriver:
        return 'offered_delivery_driver';
      case ShipmentStatus.outForDelivery:
        return 'out_for_delivery';
      case ShipmentStatus.delivered:
        return 'delivered';
      case ShipmentStatus.cancelled:
        return 'cancelled';
    }
  }

  int activeStateIndex(){
    switch (this) {
      case ShipmentStatus.pending:
        return 0;
      case ShipmentStatus.offeredPickupDriver:
        return 1;
      case ShipmentStatus.pickedUp:
        return 2;
      case ShipmentStatus.inTransitBetweenCenters:
        return 3;
      case ShipmentStatus.arrivedAtDestinationCenter:
        return 4;
      case ShipmentStatus.offeredDeliveryDriver:
        return 5;
      case ShipmentStatus.outForDelivery:
        return 6;
      case ShipmentStatus.delivered:
        return 7;
      case ShipmentStatus.cancelled:
        return 8;
    }
  }
}
