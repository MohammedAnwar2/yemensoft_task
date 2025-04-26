import 'package:yemensoft_task/core/utils/app_colors.dart';

filterStatus({required String status}) {
  switch (status) {
    case 'New':
      return AppColors.green;
    case 'Delivering':
      return AppColors.darkCyanBlue;
    case 'Returned':
      return AppColors.red;
    case 'Delivered':
      return AppColors.grey;
    default:
      return AppColors.grey;  
        
  }
}