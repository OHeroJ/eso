class DLNADevice {
  late String usn;
  late String uuid;
  late String location;
  int cacheControl = 300;
  late DLNADescription description;

  bool isFromCache = false;

  int aliveTime = 0;
  int expirationTime = 0;
  int lastDescriptionTime = 0;

  int discoveryFromStartSpendingTime = 0;
  int descriptionTaskSpendingTime = 0;

  set setCacheControl(int time) {
    cacheControl = time;
    aliveTime = DateTime.now().millisecondsSinceEpoch;
    expirationTime = aliveTime + time * 1000;
  }

  String? get deviceName {
    return description?.friendlyName;
  }

  bool get isXiaoMiDevice {
    return description?.manufacturer.toLowerCase().contains("xiaomi") ?? false;
  }

  @override
  int get hashCode => uuid.hashCode;

  @override
  bool operator ==(other) {
    if (other is DLNADevice) {
      return uuid == other.uuid;
    }
    return super == other;
  }

  Map toJson() {
    Map map = Map();
    map["usn"] = this.usn;
    map["uuid"] = this.uuid;
    map["location"] = this.location;
    map["deviceName"] = this.deviceName;
    return map;
  }

  @override
  String toString() {
    return 'DLNADevice {\nuuid: $uuid, name: ${description?.friendlyName}, location: $location, fromCache: $isFromCache,\n'
        'cacheControl: $cacheControl, aliveTime: ${_time2Str(aliveTime)}, expirationTime: ${_time2Str(expirationTime)}, lastDescriptionTime: ${_time2Str(lastDescriptionTime)},'
        '\ndiscoveryFromStartSpendingTime: ${discoveryFromStartSpendingTime}ms, descriptionTaskSpendingTime: ${descriptionTaskSpendingTime}ms}';
  }

  String _time2Str(int intTime) {
    var time = DateTime.fromMillisecondsSinceEpoch(intTime);
    return "${time.year.toString()}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
  }
}

class DLNADescription {
  late String deviceType;
  late String friendlyName;
  late String udn;

  late String manufacturer;
  late String manufacturerURL;
  late String modelDescription;
  late String modelName;
  late String modelURL;

  late List<DLNAService> dlnaServices;

  late String avTransportControlURL;
  late String renderingControlControlURL;
  late String connectionManagerControlURL;

  @override
  String toString() {
    return 'DLNADescription {deviceType: $deviceType, friendlyName: $friendlyName,'
        ' udn: $udn, manufacturer: $manufacturer, manufacturerURL: $manufacturerURL,'
        ' modelDescription: $modelDescription, modelName: $modelName, modelURL: $modelURL,'
        ' dlnaServicesLength: ${dlnaServices?.length}';
  }
}

class DLNAService {
  late String type;
  late String serviceId;
  late String controlUrl;
  late String eventSubUrl;
  late String SCPDUrl;

  @override
  String toString() {
    return 'DLNAService {type: $type, serviceId: $serviceId, controlUrl: $controlUrl, '
        'eventSubUrl: $eventSubUrl, SCPDUrl: $SCPDUrl}';
  }
}
