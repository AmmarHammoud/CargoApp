import 'package:latlong2/latlong.dart';

class SenderAndRecipientLocations {
  late final LatLng senderLoc;
  late final LatLng? recipientLoc;

  SenderAndRecipientLocations({
    required this.senderLoc,
    required this.recipientLoc,
  });
}
