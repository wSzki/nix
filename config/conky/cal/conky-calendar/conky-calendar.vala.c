/* conky-calendar.vala.c generated by valac 0.54.8, the Vala compiler
 * generated from conky-calendar.vala, do not modify */

/*
    Conky-Calendar prints a calendar with left margin spacing.
    Copyright (C) 2013 David Siewert

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <glib.h>
#include <stdlib.h>
#include <string.h>

#if !defined(VALA_EXTERN)
#if defined(_MSC_VER)
#define VALA_EXTERN __declspec(dllexport) extern
#elif __GNUC__ >= 4
#define VALA_EXTERN __attribute__((visibility("default"))) extern
#else
#define VALA_EXTERN extern
#endif
#endif

#define _g_free0(var) (var = (g_free (var), NULL))
#define _g_date_time_unref0(var) ((var == NULL) ? NULL : (var = (g_date_time_unref (var), NULL)))

VALA_EXTERN gint get_number_of_days (gint year,
                         gint month);
VALA_EXTERN gint headline (const gchar* left_margin);
VALA_EXTERN gint return_result (const gchar* output);
static gint _vala_main (gchar** args,
                 gint args_length1);
static gboolean _vala_string_array_contains (gchar* * stack,
                                      gssize stack_length,
                                      const gchar* needle);

gint
get_number_of_days (gint year,
                    gint month)
{
	gboolean _tmp0_ = FALSE;
	gboolean isLeap = FALSE;
	gint _tmp2_ = 0;
	gint* days = NULL;
	gint* _tmp3_;
	gint days_length1;
	gint _days_size_;
	gint _tmp4_;
	gint result = 0;
	if ((year % 4) == 0) {
		gboolean _tmp1_ = FALSE;
		if ((year % 100) != 0) {
			_tmp1_ = TRUE;
		} else {
			_tmp1_ = (year % 400) == 0;
		}
		_tmp0_ = _tmp1_;
	} else {
		_tmp0_ = FALSE;
	}
	isLeap = _tmp0_;
	if (isLeap) {
		_tmp2_ = 29;
	} else {
		_tmp2_ = 28;
	}
	_tmp3_ = g_new0 (gint, 12);
	_tmp3_[0] = 31;
	_tmp3_[1] = _tmp2_;
	_tmp3_[2] = 31;
	_tmp3_[3] = 30;
	_tmp3_[4] = 31;
	_tmp3_[5] = 30;
	_tmp3_[6] = 31;
	_tmp3_[7] = 31;
	_tmp3_[8] = 30;
	_tmp3_[9] = 31;
	_tmp3_[10] = 30;
	_tmp3_[11] = 31;
	days = _tmp3_;
	days_length1 = 12;
	_days_size_ = days_length1;
	_tmp4_ = days[month];
	result = _tmp4_;
	days = (g_free (days), NULL);
	return result;
}

gint
headline (const gchar* left_margin)
{
	gint result = 0;
	g_return_val_if_fail (left_margin != NULL, 0);
	g_print ("%s%3s%3s%3s%3s%3s%3s%3s\n", left_margin, "Mo", "Tu", "We", "Th", "Fr", "Sa", "Su");
	result = 0;
	return result;
}

gint
return_result (const gchar* output)
{
	gint result = 0;
	g_return_val_if_fail (output != NULL, 0);
	g_print ("%s\n", output);
	result = 0;
	return result;
}

static gboolean
_vala_string_array_contains (gchar* * stack,
                             gssize stack_length,
                             const gchar* needle)
{
	gssize i;
	for (i = 0; i < stack_length; i++) {
		if (g_strcmp0 (stack[i], needle) == 0) {
			return TRUE;
		}
	}
	return FALSE;
}

static gint
_vala_main (gchar** args,
            gint args_length1)
{
	gchar* left_margin = NULL;
	gchar* _tmp0_;
	gchar* _result_ = NULL;
	gchar* _tmp2_;
	GDateTime* now = NULL;
	GDateTime* _tmp3_;
	gint day_of_week = 0;
	GDateTime* _tmp4_;
	gint day_of_month = 0;
	GDateTime* _tmp5_;
	gint number_days = 0;
	GDateTime* _tmp6_;
	GDateTime* _tmp7_;
	gint j = 0;
	gint starting_day_of_week = 0;
	gint i = 0;
	gint x = 0;
	gint y = 0;
	const gchar* _tmp10_;
	const gchar* _tmp11_;
	gchar* _tmp12_;
	gint _tmp19_;
	const gchar* _tmp40_;
	gint result = 0;
	_tmp0_ = g_strdup ("                             ");
	left_margin = _tmp0_;
	if (_vala_string_array_contains (args, args_length1, "headline")) {
		const gchar* _tmp1_;
		_tmp1_ = left_margin;
		result = headline (_tmp1_);
		_g_free0 (left_margin);
		return result;
	}
	_tmp2_ = g_strdup ("");
	_result_ = _tmp2_;
	_tmp3_ = g_date_time_new_now_local ();
	now = _tmp3_;
	_tmp4_ = now;
	day_of_week = g_date_time_get_day_of_week (_tmp4_);
	_tmp5_ = now;
	day_of_month = g_date_time_get_day_of_month (_tmp5_);
	_tmp6_ = now;
	_tmp7_ = now;
	number_days = get_number_of_days (g_date_time_get_year (_tmp6_), g_date_time_get_month (_tmp7_) - 1);
	j = day_of_month;
	starting_day_of_week = day_of_week;
	while (TRUE) {
		gint _tmp8_;
		gint _tmp9_;
		if (!(j != 1)) {
			break;
		}
		_tmp8_ = j;
		j = _tmp8_ - 1;
		_tmp9_ = starting_day_of_week;
		starting_day_of_week = _tmp9_ - 1;
		if (starting_day_of_week == 0) {
			starting_day_of_week = 7;
		}
	}
	i = 0;
	x = starting_day_of_week - 1;
	y = 1;
	_tmp10_ = _result_;
	_tmp11_ = left_margin;
	_tmp12_ = g_strconcat (_tmp10_, _tmp11_, NULL);
	_g_free0 (_result_);
	_result_ = _tmp12_;
	{
		gint k = 0;
		k = 0;
		{
			gboolean _tmp13_ = FALSE;
			_tmp13_ = TRUE;
			while (TRUE) {
				const gchar* _tmp15_;
				gchar* _tmp16_;
				gchar* _tmp17_;
				gchar* _tmp18_;
				if (!_tmp13_) {
					gint _tmp14_;
					_tmp14_ = k;
					k = _tmp14_ + 1;
				}
				_tmp13_ = FALSE;
				if (!(k < x)) {
					break;
				}
				_tmp15_ = _result_;
				_tmp16_ = g_strdup_printf ("%3s", "");
				_tmp17_ = _tmp16_;
				_tmp18_ = g_strconcat (_tmp15_, _tmp17_, NULL);
				_g_free0 (_result_);
				_result_ = _tmp18_;
				_g_free0 (_tmp17_);
			}
		}
	}
	_tmp19_ = i;
	i = _tmp19_ + 1;
	while (TRUE) {
		gint _tmp33_;
		gint _tmp34_;
		if (!(i < (number_days + 1))) {
			break;
		}
		if (i < day_of_month) {
			const gchar* _tmp20_;
			gchar* _tmp21_;
			gchar* _tmp22_;
			gchar* _tmp23_;
			_tmp20_ = _result_;
			_tmp21_ = g_strdup_printf ("%3s", "x");
			_tmp22_ = _tmp21_;
			_tmp23_ = g_strconcat (_tmp20_, _tmp22_, NULL);
			_g_free0 (_result_);
			_result_ = _tmp23_;
			_g_free0 (_tmp22_);
		} else {
			if (i == day_of_month) {
				if (_vala_string_array_contains (args, args_length1, "before")) {
					const gchar* _tmp24_;
					_tmp24_ = _result_;
					result = return_result (_tmp24_);
					_g_date_time_unref0 (now);
					_g_free0 (_result_);
					_g_free0 (left_margin);
					return result;
				} else {
					if (_vala_string_array_contains (args, args_length1, "now")) {
						gchar* _tmp25_;
						gchar* _tmp26_;
						gint _tmp27_;
						_tmp25_ = g_strdup_printf ("%3d", i);
						_tmp26_ = _tmp25_;
						_tmp27_ = return_result (_tmp26_);
						_g_free0 (_tmp26_);
						result = _tmp27_;
						_g_date_time_unref0 (now);
						_g_free0 (_result_);
						_g_free0 (left_margin);
						return result;
					} else {
						if (_vala_string_array_contains (args, args_length1, "after")) {
							gchar* _tmp28_;
							_tmp28_ = g_strdup ("");
							_g_free0 (_result_);
							_result_ = _tmp28_;
						} else {
							g_print ("ERROR");
						}
					}
				}
			} else {
				const gchar* _tmp29_;
				gchar* _tmp30_;
				gchar* _tmp31_;
				gchar* _tmp32_;
				_tmp29_ = _result_;
				_tmp30_ = g_strdup_printf ("%3d", i);
				_tmp31_ = _tmp30_;
				_tmp32_ = g_strconcat (_tmp29_, _tmp31_, NULL);
				_g_free0 (_result_);
				_result_ = _tmp32_;
				_g_free0 (_tmp31_);
			}
		}
		_tmp33_ = i;
		i = _tmp33_ + 1;
		_tmp34_ = x;
		x = _tmp34_ + 1;
		if (x == 7) {
			const gchar* _tmp35_;
			const gchar* _tmp36_;
			gchar* _tmp37_;
			gchar* _tmp38_;
			gchar* _tmp39_;
			x = 0;
			y = y + 1;
			_tmp35_ = _result_;
			_tmp36_ = left_margin;
			_tmp37_ = g_strconcat ("\n", _tmp36_, NULL);
			_tmp38_ = _tmp37_;
			_tmp39_ = g_strconcat (_tmp35_, _tmp38_, NULL);
			_g_free0 (_result_);
			_result_ = _tmp39_;
			_g_free0 (_tmp38_);
		}
	}
	_tmp40_ = _result_;
	g_print ("%s\n", _tmp40_);
	result = 0;
	_g_date_time_unref0 (now);
	_g_free0 (_result_);
	_g_free0 (left_margin);
	return result;
}

int
main (int argc,
      char ** argv)
{
	return _vala_main (argv, argc);
}

