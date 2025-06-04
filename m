Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995D324B26
	for <brcm80211@lists.linux.dev>; Wed,  4 Jun 2025 14:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047085; cv=none; b=MZuHHmrPY0UtmwAhCJhG8XZzxqwm6SKibyIj/rLcHmX6pvH4+51H28IQLkfypbXAP1kDOwZukXwydcbW+a4GMjP2ARy9hc5gjAdVh0LAq2Vz+TeT/DobtmtpjfoRgT/cbLgwqe70t0PSK21nO7JtVl/HzxO+eqAOpKGDsLSFXaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047085; c=relaxed/simple;
	bh=YuqOo5L+8xUvvncKuuiWvwOIBMMlZGWXUxJnmeSv7Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kiPQGLqgp1rUTbuGsZ+yagAV0xdKCikKLhsJqvUIX5Ldmm9ZdhRi5XIKFdoyOV3PR+OENUqYPinJmbeH9WyS3AlB5rRPvI8oDUOPjIIZFxvXoOoD10HBCm94SFY2KFaM8fSLt6OD7ja9rXg+IolkotdSU150syJfHjovGRW8LYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+gdz1T5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+gdz1T5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547t2BN032469
	for <brcm80211@lists.linux.dev>; Wed, 4 Jun 2025 14:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0IJLY6xsEZDcUG0P74uRftlOIFbWofcg0+xhUvkejEU=; b=N+gdz1T5dhbHZgW9
	Wojb/Pp10zKIl6PSwBtfpvCm15x7sYdtxR5mkmvTGi8xeHBESL8nnWfwBT/xwafu
	s89PUhFB/CMVWGbAnOz2+ViUSlW0MPZ0aFN2s+euf1/hSNUhfFmi4a0EmU8cj6vz
	wEsKX7gJul2TyCg3ZAOy+MajGlHth/fHYz7RrqNgGsj9lNVSJK6rln3GzvbcgOtU
	qyc3pCyCHxB/pkNX2QmXNrbd6k9KM5fGiptaLDZx/rIPZkZRoikI1GqGrtzFFk8E
	ln81hYtkcj2dBJgfPEBApBUOtAc51VacIqq1YR6x+J5rH94qjTvgN+cHTh1rGetP
	PJuqNg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfuw631-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 14:24:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e0fee459so765482a12.1
        for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 07:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749047081; x=1749651881;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0IJLY6xsEZDcUG0P74uRftlOIFbWofcg0+xhUvkejEU=;
        b=Om5sNC8jnRtc/3G2lj0bSKKwGjCT2aUdn6RMcSHYsQgYpAp0YIZf3w2d1FDiikRZ7U
         kTYvcUU/UK5hTKt7E4oC3w+B0tXhkZbA+KkjWBy3Dka4N7ZpLYEfTPFJ54mnpLi4eIXi
         sOmrWKpeX5jp4Q71RliRTbs6s6XYHb8yxJavzsSOO5+h0DHu4Kgg5j2l9Bw+GVN1B49b
         TM/4ivPO1IKUteuEwXr/kY/NgPjb1NoKC+vci+vYxLTbPuaZxeWU9Vj6hUc6YHq/daYs
         hVE44ASfQ9hFqyMsdfnnMcW2gfdtS8FghG184Z/5V5ZLUgzqEcELhY8kIEp7tD7MWdEo
         tsEw==
X-Forwarded-Encrypted: i=1; AJvYcCXCTn1JvRJhPSZlQeeRbv3yXcpRt23CBC5TIhpdj3YDIUsgyY/ffnOTpbTVlmHgmlaIQFBdvd1j3Rk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdtGq0aae+945Xd94zrHj4KrS+x+or1Ql62amyf0xxTOlecsIb
	uMnKYwHX7NuHHRvcWeqKw3DaykN4T9O+Kzk09yIBiLdbWLmCvwgCi4hjPdyR0HepdTfDHbiDY/z
	Jox2NC8UqkwXjyKYhhJeNsbx635gB4Nugy+OJP6Q+Ozh9Fx1uEiNdBPLrin4XULs=
X-Gm-Gg: ASbGncsRTu/41naPl4IOnhgEgX7y7zX+uAqFzLm39UBbp6xaPYl1OEN7+f587AsSN4o
	stJcYY/4sqCDPf9mOQz4Pch6UcmJJwx1lxatVkL6N7S3XFCkFoka6Qh2ELMnbmC0D8YEue6EV4q
	B8GcWSb2drwrMTUzLOWpxV6sQl0s1QX2/DhZG5LlfUpXNHuyK0Z1f3bilxB7zxp/L+LtiD2H/rm
	i0Ok28jzZq0k7XJ4WlaDN1Fl7011GJSt47Y2bEvSl97y8NKzsnJjI0GAkKFb+oeh7BQyYKuymph
	AIvss8jTEWrgcs3Op29dD4E9cDA3jwpyusReVuTBFSiNsQjaWrie+lCztocObZOkBcg=
X-Received: by 2002:a17:90b:350c:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-312e80285c0mr10631063a91.11.1749047080887;
        Wed, 04 Jun 2025 07:24:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJgMv73IHmYkK5db7JqbBVYy6pAWpAH5/6I52na6kJ17Rbbqm2aLVI8AGnqaxQfJag8UYx0A==
X-Received: by 2002:a17:90b:350c:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-312e80285c0mr10631020a91.11.1749047080409;
        Wed, 04 Jun 2025 07:24:40 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-312d8f563c2sm3848568a91.10.2025.06.04.07.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 07:24:40 -0700 (PDT)
Message-ID: <966fffd8-1ff4-4a29-a0a7-fd081a12dd45@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 07:24:38 -0700
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/4] wifi: nl80211: strict checking attributes for
 NL80211_CMD_SET_BSS
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev
References: <20250604085539.2803896-1-arend.vanspriel@broadcom.com>
 <20250604085539.2803896-4-arend.vanspriel@broadcom.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250604085539.2803896-4-arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6840572a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=k6iyqhMwue5QZAiwf48A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: uopul4VqZCmA6WIS_4IilUNpemjU2vc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMCBTYWx0ZWRfX13f4tHPfumhm
 VEItwxaZoSEJ3KfJRCMTojdjaEr35IYnQXmGY4qdR+f2Q3SeIcsGbYPPaaNjbwaajBtgKQhBS2B
 em91nkCS047Zazczk5hAbwPjN72t2/JzR5c89uRnRFZI26+NukzVNZYjBEqhZoC3JVgXn0Vxkq8
 UcH7VLGOTdTYccslbSbgKMkR33klalQ5EkCXLjAoOGYdB+ll81fenmQOlTzf8f8yu8qibIdwwyU
 1gtcq1Gu/fYgf46y0du7Eze5XWux1TavKydqiBNxHFRPYqSGjhd54uN78zPoqLmh4s/F6Q5OA3G
 qcURxogTHvptSGpGFKsCM1tUcS3fPoF/b4IVGfEvcRJgMYfWG4U80WEUitkPaAf4kySsEXmSUvd
 fVMesiMOd2xDDFU1uYeEKsncBaXvF+/qLk+WexpLaVkfnGYxW2si5dfzw3vB2RKpxCcZ6XHm
X-Proofpoint-GUID: uopul4VqZCmA6WIS_4IilUNpemjU2vc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=936 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040110

On 6/4/2025 1:55 AM, Arend van Spriel wrote:
>   * @NL80211_ATTR_BSS_PARAM: nested attribute used with %NL80211_CMD_GET_WIPHY
> - *	which indicates which BSS parameters can be modified.
> + *	which indicates which BSS parameters can be modified. The attribute can
> + *	also be used as flag attribute by user-space in %NL80211_CMD_SET_BSS to
> + *	indicate that it wants strict checking on the BSS parameters to be
> + *	modified.

again yuck that this attribute id is a nest in one usage but a flag in another
usage :(


