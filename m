Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315AC291888
	for <brcm80211@lists.linux.dev>; Wed,  4 Jun 2025 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047824; cv=none; b=kKn06ExD1rqwnrEILEY4dbdyQrI4iOoxtg1sOgTY4+aPxFaOlr6pf/9wgYhEaWDUAqvQICzIN94UVecSi39Fy8CoC6qiODYM29Q6NQYPxvCT2B6kikFDIgSqJk0fIL3aABWptT61oA7zKku4fof2Xabp+5k2dQvW7A2dpt39xAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047824; c=relaxed/simple;
	bh=D4uQnYO7eT0RiXF98lVoWDEX1Dju5FG9OaJV45xbPiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5eMRHsnUBdZlXPbIw8bTU3IuORrGR6XYqCejffzwzKaHbXwzHWdpHs5I6AUft7Frnqyte2DMZkJGLOXGojI4kMkwF851dw0szwsDS/pq0h4IVUZ7XS68oyE3B4vDTHmMX08P5k3FQu0XhPyp8h5ftbz5YgjjPHIrcjAz7lgqb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhuO+SM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RhuO+SM5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547mpNj028357
	for <brcm80211@lists.linux.dev>; Wed, 4 Jun 2025 14:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1I0pTSJGbNdQ720pHeNjnDHHyYzMawbLnkg+0ptY05w=; b=RhuO+SM5YQvH9wme
	WMS+2yEdhxTVMVP3kgChYGOWZK1tykmfdPybUNgwe+iG4Opp8+3I1esayiO+Jj3T
	m1D+rhajUiWBuqVQr+nQZmQTqtYs6gDqm2z7vId1zhj/2fxwCZp6nlVLpEUo2agt
	nqi/AQGwnn47Wg7xsz1+pvBnLf+i+rdhXAqcfNEAeL27kLiUtcwj3uxNTqmBUZR7
	gguQECRc1+2gO9U6fzHUZJ/DYTOCwSmxdL80AzuUAhHSg3z9AGBPi1Pl41a1FvBx
	ztxWKrdeeLQ9w3uoomwOJ3Kmfo8eA3XpKMgqkUzO7dZ52OcucGQvVFXXw4VFWfLO
	q3beUA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8txd8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 14:37:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b19226b5f7dso829092a12.0
        for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 07:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749047820; x=1749652620;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1I0pTSJGbNdQ720pHeNjnDHHyYzMawbLnkg+0ptY05w=;
        b=k1T/0L4GXDHwy512+aM0jG+fU5on9hvLqzaR+2yUz8s2D5p9/+E3KiA1MxW83XDOvM
         bwUJHUKOKCBR6fUkoQsGtww78cziAUCojpXua4HuNE6F+zE6pKfWVvdCt1tLcI92sw5e
         ILAv/db22uCQHPvolUq6wf1a4UsD72N85PN5+vxKBd6mMHD1k0Bi+bDqGJUZivIj4bpB
         hm0qTm0q7XXIilnrFhba5BcQYyGC2nnMmBVHSxflkQapcqdvtS4i2qwn/YixZx6jLGsR
         0HjqJDQKlTQ5SrESnj3/jhgw0uRkD0V4v+1iDZwfrO+RwfeDvbsbx131zr12bZA4lOUn
         rHHg==
X-Forwarded-Encrypted: i=1; AJvYcCWtrURl3sdqyYf3rTpdpUpczv/5fIjAzHzor71fSI2G8l5kA2PWsa1Rq0VyJAv0o9dE5XepWhCnxQg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFc4lELuz3IA40juuWQPHPlKPorkgF7Cc0f6kvABKsuTeJ2Yrp
	4B+S+jx2Dk9C01uIDWgd0AAFhb1ip6LOI9i51Jt9PvM3Y/f4xmxBSF47uKoV8p3o79WGIGprp7H
	z9NYhuJOXmTMpVhvW7P8/Ek6x2GIPoC9e3h9kZKOL8elaQ7PD9RIkV6sgcNVyupQ=
X-Gm-Gg: ASbGncvfy7Qo2b1Ad1/5fdv2OpM3GSNtyA5LSzz5C1SYDC9uzTDEoocd9CQQBLfJhD8
	BDkfb2bN1yYUoFoEaFhQwyGfQHhCoB5AN2+4NIU9ew7FrLIiN0RONcH0bXgeIllLdxuW7PjIf23
	QKH/S8cZMr0l6CuR+ICusWlQj4Jqb2/ZuIUkdDTjGmfOYJRBrZ+smZuKPKlURaQSc56lHZQvBzj
	2KkHXiryKCF3TNbQlhP22Ysme0YNgfrH5uehRo4yFqrAE54QgDP3ELiR42T7B+MSDdY9Tvn9a1h
	zpoke2sYPB84+SBzhesQOiq9SyHSxAeXp+Ov01rcfrrHpFTPmMqoeevado9ylABNJ3A=
X-Received: by 2002:a17:90a:dfd0:b0:311:b5ac:6f7d with SMTP id 98e67ed59e1d1-3130db44b34mr4122836a91.6.1749047820326;
        Wed, 04 Jun 2025 07:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGde+Nfl8rFYASmgoSZK/FCW5irkGZrrIOIOrhaN9afSKb+U2epla4AQv0p4YnT/qFm0NFUyQ==
X-Received: by 2002:a17:90a:dfd0:b0:311:b5ac:6f7d with SMTP id 98e67ed59e1d1-3130db44b34mr4122803a91.6.1749047819545;
        Wed, 04 Jun 2025 07:36:59 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3d7aaasm9006591a91.48.2025.06.04.07.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 07:36:59 -0700 (PDT)
Message-ID: <c541e288-7859-4f50-a4a8-b7a6ee38cd99@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 07:36:57 -0700
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/4] brcmfmac: support AP isolation to restrict reachability
 between stations
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
        Wright Feng <wright.feng@cypress.com>,
        Chi-hsien Lin <chi-hsien.lin@cypress.com>,
        Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
References: <20250604085539.2803896-1-arend.vanspriel@broadcom.com>
 <20250604085539.2803896-5-arend.vanspriel@broadcom.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250604085539.2803896-5-arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dhw8DlPw1lUE1jnM2ki41UI0XHvreItD
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=68405a0d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=PW-KNzBFAAAA:8 a=bUQKSiCPAAAA:8
 a=Q-fNiiVtAAAA:8 a=ej4xoFaHywEyN7SLwwwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=84zbTXrhsdUYOv-GFPQN:22 a=-fHZXUhsFbuwFN3fwQAr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMCBTYWx0ZWRfX5TG815/sTN7P
 1fBauaA7cSThis0H7nrAG4qbRAQNefUtapk6oqafnqIzriA71198ASTFocOb3faz5uixU/8Fw+F
 7jDKK71CVHVgeAEZLW60KBOoQMiV6sSvEmTgR5sINzFSlFMzvTACVsNSYlxUj5l13dU2UhbkKrP
 2dG3Wl5aNaYp2qIko0tuMg65IdIOVWeJ0PhY65jGRRINxDQNc47rf1i96FySeWMVJqViwNSAaVu
 JIahk5Q2H37/aJg6T3gUgJzZ54Eb0gzMraXFVG8pgZTuaZdEwTg2qt/dNLBFSqWMUQRSVpygHcP
 tf7oKTGB+zNwl0x7JxhHhvf5+xAxAoNrPb9GSfSvwdbfTxPIAoKMakDMiSrPNJuWXaI8qf7gsJz
 eGvkK7TC6VORL70iNn+Wi6HiN98F6HJ8HDXPepAuMrppIhH5HMdFEIY+xohD2qX0O9KmLu3R
X-Proofpoint-ORIG-GUID: Dhw8DlPw1lUE1jnM2ki41UI0XHvreItD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040110

On 6/4/2025 1:55 AM, Arend van Spriel wrote:
> From: Wright Feng <wright.feng@cypress.com>
> 
> hostapd & wpa_supplicant userspace daemons exposes an AP mode specific
> config file parameter "ap_isolate" to the user, which is used to control
> low-level bridging of frames between the stations associated in the BSS.
> 
> In driver, handle this user setting in the newly defined cfg80211_ops
> function brcmf_cfg80211_change_bss() by enabling "ap_isolate" IOVAR in
> the firmware.
> 
> In AP mode, the "ap_isolate" value from the cfg80211 layer represents,
>  0 = allow low-level bridging of frames between associated stations
>  1 = restrict low-level bridging of frames to isolate associated stations
> -1 = do not change existing setting
> 
> Signed-off-by: Wright Feng <wright.feng@cypress.com>
> Signed-off-by: Chi-hsien Lin <chi-hsien.lin@cypress.com>
> Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
> [arend: indicate ap_isolate support in struct wiphy::bss_param_support]
> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> index dc2383faddd1..d6c8ad7ebced 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> @@ -5933,6 +5933,26 @@ static int brcmf_cfg80211_del_pmk(struct wiphy *wiphy, struct net_device *dev,
>  	return brcmf_set_pmk(ifp, NULL, 0);
>  }
>  
> +static int brcmf_cfg80211_change_bss(struct wiphy *wiphy, struct net_device *dev,
> +				     struct bss_parameters *params)
> +{
> +	struct brcmf_if *ifp = netdev_priv(dev);
> +	int ret = 0;
> +
> +	/* In AP mode, the "ap_isolate" value represents
> +	 *  0 = allow low-level bridging of frames between associated stations
> +	 *  1 = restrict low-level bridging of frames to isolate associated stations
> +	 * -1 = do not change existing setting
> +	 */
> +	if (params->ap_isolate >= 0) {
> +		ret = brcmf_fil_iovar_int_set(ifp, "ap_isolate", params->ap_isolate);
> +		if (ret < 0)
> +			brcmf_err("ap_isolate iovar failed: ret=%d\n", ret);
> +	}
> +
> +	return ret;
> +}
> +
>  static struct cfg80211_ops brcmf_cfg80211_ops = {
>  	.add_virtual_intf = brcmf_cfg80211_add_iface,
>  	.del_virtual_intf = brcmf_cfg80211_del_iface,
> @@ -5980,6 +6000,7 @@ static struct cfg80211_ops brcmf_cfg80211_ops = {
>  	.update_connect_params = brcmf_cfg80211_update_conn_params,
>  	.set_pmk = brcmf_cfg80211_set_pmk,
>  	.del_pmk = brcmf_cfg80211_del_pmk,
> +	.change_bss = brcmf_cfg80211_change_bss,
>  };

So the real question is do we really *need* all of the other patches, or is it
OK for the driver to just process the one attribute it wants without
indicating that is the only attribute it handles to userspace? I know of one
out-of-tree cfg80211 driver that has only handled AP isolate for a long time,
and AFAIK there have not been any issues.

In other words, why isn't just the two diffs above enough to satisfy the need?

>  
>  struct cfg80211_ops *brcmf_cfg80211_get_ops(struct brcmf_mp_device *settings)
> @@ -7634,6 +7655,9 @@ static int brcmf_setup_wiphy(struct wiphy *wiphy, struct brcmf_if *ifp)
>  				    BIT(NL80211_BSS_SELECT_ATTR_BAND_PREF) |
>  				    BIT(NL80211_BSS_SELECT_ATTR_RSSI_ADJUST);
>  
> +
> +	wiphy->bss_param_support = WIPHY_BSS_PARAM_AP_ISOLATE;
> +
>  	wiphy->flags |= WIPHY_FLAG_NETNS_OK |
>  			WIPHY_FLAG_PS_ON_BY_DEFAULT |
>  			WIPHY_FLAG_HAVE_AP_SME |

Ultimately that out-of-tree driver I know so well would adopt this scheme if
it lands, but it currently support AP isolate without all of the other changes.

/jeff
