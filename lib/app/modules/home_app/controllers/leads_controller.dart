import 'package:monitoring_karyawan/app/modules/home_app/leads_model.dart';
import 'package:monitoring_karyawan/app/modules/home_app/providers/leads_provider.dart';

class LeadsController {
  final LeadsProvider _leadsProvider;
  LeadsController(this._leadsProvider);

  Future<Leads?> loadLeads(id) async => await _leadsProvider.getLeads(id);
}
