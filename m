Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BAE217F3D
	for <brcm80211@lists.linux.dev>; Wed,  4 Jun 2025 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046013; cv=none; b=N6Wbu21CIjpMYdQMSmLnfdG5KBCXldUCQ8HVx8Wlb2cuFOSoypgvtts2S+yYbyQRaX3Ug/CrQC+V7aCdyeO8Y/1Ja0LiewP17TA079sr3Wiuedogr8SDaMjDSL51pCLGwMgUQv1SlF0/1UgMaHe4z8brsrQMC9xg0diuemXE6nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046013; c=relaxed/simple;
	bh=LOo9ZQEz2NWZxk7/gOL/t1SfJFqG5AFEJZkaR+Yxe0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfWZ2BMf8o4Zd3hVtfYaF6JAkotoHAIqBn528VoZAs3/wY/idTwqVSHSeXJd2oM+1BtNmQDEC+YfDkHqVI4R+bOATKhGoyqjsqv3ldnt7jT67PFVaquzCUPC0CIiPMICA8hjrenzMZqqqfwY5bEVeEyI8I7ftOqck+aop4LDkm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzEdI2Y9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzEdI2Y9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554810L8004261
	for <brcm80211@lists.linux.dev>; Wed, 4 Jun 2025 14:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xGJcvc9WybfZJgw/bBO7SWLMjxjlq76pjlmBZ4c3T4=; b=mzEdI2Y9y/GluoPI
	y0/Rdrp4zurGeFx3oOJTo3QG18y3h2kRt20Or/x+dsYFABzthLpFm55uK3u2RORI
	j8ApaTVQzvvSX/45MM2o7C5iqVlWqYzQMHwf/OzsZcfNxY+66YxBm2l2RjtBLSMB
	Ncuviqo5hiVLhpn9m+UOiayvMTbouCNVYtFkb6kYNp8rqdCdPr2iS2xwrXCBDot8
	eWDQB24BF2jKO3LU5wGxdp7ok7tNqusOnyG+z6E8+uygdfyQkLiH5Ke//qOa5DCD
	MYB/U71HvjD2EqZ5ZjqPg7VuNc/bahSZMk4eQG8V9qaNJYvNWG7eP7k+Zj2m9IFe
	IrXPfQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rxacj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 14:06:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23507382e64so61932955ad.2
        for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 07:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749046010; x=1749650810;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xGJcvc9WybfZJgw/bBO7SWLMjxjlq76pjlmBZ4c3T4=;
        b=OAITqekMivIGvi6U9SgLuERPRaXMqzzbIVs99MSUBDVOhjK4SJ9B7cywBUj7G/ETAN
         Vd6rE5wwsRpNKwcbScWHfAzVObKztUexoiiy/1ZwStxJFx4wG5gwyJbJ1/+PggFG1L3F
         GCH1n5g3D68zrSOTTmheLQpSD9U42iBM8Xuq7AfhG/Vo6bk4jwhcZdEzMMSIxm1uBQ+/
         +PtI/2X7YhutHmUetklHKCbZgSZMCjeJmzLvFoaVe3AI9nEL7LwpSpFAwlNH6JYSBtml
         eYrwTaXqo4gz69B0+VRWZ85XeXBuTxiq3xqx4dkUJyfMq0uQOKQtd6d4Pp6ht7CRXfA9
         W7wA==
X-Forwarded-Encrypted: i=1; AJvYcCXmJawN9kCISIRkDjBKjUNb042iQ7I2J4Y+EmpAXP2Vtm3W7g0E9N5xyT26msjv4LKRfLDq8eyO1kQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfUrvpQRxFj+TFHyNb/mXP+ODZdbURt7xKAGaiX6U5/davIAde
	2Ol4qf9cOhK7TKAhjP6GTG2cGQyLv6agoobeM6La4A89BYkUQbH/OBv+uh2VEZH4V2M5e2OtxeM
	lnSdvnRuQ5TaobGPv8/ZJEx+x/yzBQIvp824Sh0B3X+m6aPOHNlGpE1iIfWAoFiQ=
X-Gm-Gg: ASbGncsB5btG4Ifjj7eqefCocPOkVCutEVxtykNG2/lCo770//HLNuDFfnuo5sErObX
	RTeDkzT6ZuutCpwxInp6GIPfUerU66bmoWOubQ14bjg3kad+M61sk6AMPr+6g9UZXs+1dXh3hvV
	1rFSYdpD+E4xf6u4LDogpwapqUzdS0w7dTVenK9IExW1k2zKXh12Z7QEc6tNL3VTzWS5hgFJ0j7
	To3OmMjlk1r8bbfuKmBq/cYpZ+DecHKy+H4dhkTO662lo5ViIkj2NxE/eNIYK7aNlW2yB1qOxVh
	PmanJ7kXYqoSNDGo6oZkErBlTHOiYsUJDKbT8fhoCTKcgO620QQnf6vLFK8iezj9WRc=
X-Received: by 2002:a17:903:228a:b0:220:df73:b639 with SMTP id d9443c01a7336-235e11e74d0mr47249225ad.36.1749046009711;
        Wed, 04 Jun 2025 07:06:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGflRO9w76DKHbAxPNGfV+PyKTLHNhK10nzU7kGlFNAVVDrT2kDI9qtGLy2XLTX3EWJ4VEkVQ==
X-Received: by 2002:a17:903:228a:b0:220:df73:b639 with SMTP id d9443c01a7336-235e11e74d0mr47248775ad.36.1749046009289;
        Wed, 04 Jun 2025 07:06:49 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb5cf4sm8730238a12.63.2025.06.04.07.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 07:06:48 -0700 (PDT)
Message-ID: <926c66d7-91a6-4555-9c2e-6557400eb5ba@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 07:06:47 -0700
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/4] wifi: nl80211: allow drivers to support subset of
 NL80211_CMD_SET_BSS
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev
References: <20250604085539.2803896-1-arend.vanspriel@broadcom.com>
 <20250604085539.2803896-2-arend.vanspriel@broadcom.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250604085539.2803896-2-arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ShkSEiLOFHpBwsZkePsMDJWA58HalD4Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwOCBTYWx0ZWRfX6kaHkAo7ofEo
 oj7XozhGbH7bbLeHdF2+9bLqAavG45AL4h/1aqMMwBGyR3tc2wM69M/k4wAMINiqlH5GxO9+B3w
 LB9FuiG5XaCEFR+2ChdCqkv896H757XiePPOwhSBZYBSnmunt7pCT5l1EnaCEFnFaeEHahDNmje
 /eIF7+hIJBnjSEuElBHGDOMwnFHR0/dX9Gg5HJrkszQok7ZqDOw7BNM+PaNs8oYiycJsTMs3IoQ
 iq72cTvlnjxN7NiFItdAuUrC9Z5dpqx1PYBUHmPC1D26m8RsX5tB7D79SOEkOOSMhxRNreDgKpC
 80iJHmOLKAx0SyE/tupC+y7zPL+FI0QoE3ZPjP8BdjUcWm2r3bCPznp8k6ygBzuJSroPL5siER1
 hrJuD4KSg82j64dmjQMClKXTruXXUydMlD32wG1gOjc91FOkc1T4lCsyuRm17m+QNsuVoX4o
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=684052fa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=ssMj3LTDSvaIlfdxBTsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ShkSEiLOFHpBwsZkePsMDJWA58HalD4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040108

On 6/4/2025 1:55 AM, Arend van Spriel wrote:
> @@ -2899,6 +2899,9 @@ enum nl80211_commands {
>   *	APs Support". Drivers may set additional flags that they support
>   *	in the kernel or device.
>   *
> + * @NL80211_ATTR_BSS_PARAM: nested attribute used with %NL80211_CMD_GET_WIPHY
> + *	which indicates which BSS parameters can be modified.
> + *

Ideally this should describe what is contained in the nested attribute

> @@ -2996,6 +2996,40 @@ static int nl80211_send_wiphy(struct cfg80211_registered_device *rdev,
>  			    rdev->wiphy.ext_features))
>  			goto nla_put_failure;
>  
> +		if (rdev->wiphy.bss_param_support) {
> +			struct nlattr *nested;
> +			u32 parsup = rdev->wiphy.bss_param_support;
> +
> +			nested = nla_nest_start(msg, NL80211_ATTR_BSS_PARAM);
> +			if (!nested)
> +				goto nla_put_failure;
> +
> +			if ((parsup & WIPHY_BSS_PARAM_CTS_PROT) &&
> +			    nla_put_flag(msg, NL80211_ATTR_BSS_CTS_PROT))
> +				goto nla_put_failure;
> +			if ((parsup & WIPHY_BSS_PARAM_SHORT_PREAMBLE) &&
> +			    nla_put_flag(msg, NL80211_ATTR_BSS_SHORT_PREAMBLE))
> +				goto nla_put_failure;
> +			if ((parsup & WIPHY_BSS_PARAM_SHORT_SLOT_TIME) &&
> +			    nla_put_flag(msg, NL80211_ATTR_BSS_SHORT_SLOT_TIME))
> +				goto nla_put_failure;
> +			if ((parsup & WIPHY_BSS_PARAM_BASIC_RATES) &&
> +			    nla_put_flag(msg, NL80211_ATTR_BSS_BASIC_RATES))
> +				goto nla_put_failure;
> +			if ((parsup & WIPHY_BSS_PARAM_AP_ISOLATE) &&
> +			    nla_put_flag(msg, NL80211_ATTR_AP_ISOLATE))
> +				goto nla_put_failure;
> +			if ((parsup & WIPHY_BSS_PARAM_HT_OPMODE) &&
> +			    nla_put_flag(msg, NL80211_ATTR_BSS_HT_OPMODE))
> +				goto nla_put_failure;
> +			if ((parsup & WIPHY_BSS_PARAM_P2P_CTWINDOW) &&
> +			    nla_put_flag(msg, NL80211_ATTR_P2P_CTWINDOW))
> +				goto nla_put_failure;
> +			if ((parsup & WIPHY_BSS_PARAM_P2P_OPPPS) &&
> +			    nla_put_flag(msg, NL80211_ATTR_P2P_OPPPS))
> +				goto nla_put_failure;
> +			nla_nest_end(msg, nested);

I'm personally not a fan of (ab)using attribute ids in this manner. This means
the receiver would need two different nla_parse policies, one that expects
these to be NLA_FLAG when parsing the new attribute, along with the existing
policy (such as the kernel's own nl80211_policy[NUM_NL80211_ATTR]) that is
currently used when parsing the actual attributes.

Does nl80211 have existing examples of using attribute ids like this?

/jeff
