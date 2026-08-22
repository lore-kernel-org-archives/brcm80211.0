Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC6A1A3160
	for <brcm80211@lists.linux.dev>; Sat, 22 Aug 2026 18:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787423821; cv=none; b=fm8uOEyyLfjpsPIsFkXo8atR2Btx8BJHX0j/hCp11KMrWWuhsYSsZqLFJQf/+dLDwwiJ0CoQ2YgkrUnrWnDDGSQe54aZ0tUTOO8ylxCqLJfDBr2l4nynVkgvNIMWSHmmTkctjiR9G/9aLpSPDaQ1lSrLBB9GOJ0ecpOeGsNy9Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787423821; c=relaxed/simple;
	bh=/bLgPtanEHCqRSINFQyyFks+a32vTas2v53/QbfupqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K13n4OupW8IUPRySX+q9lPvTAkjmHZudR8TBt5j/I7eHfsoVg09tU+ajjXHjhqnDVtAw1QYV7HAlo0PCDVIyxHkT2h0aO9F6sYINWAbxG9NSS9oiFf6TKlzRkv1e+ZyLmlj30CeYWLEIIzq8Vec99vpAjdSQMXIO5aECZ+1KL0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WvAZi+x7; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WvAZi+x7"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1515756a91.2
        for <brcm80211@lists.linux.dev>; Sat, 22 Aug 2026 11:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787423820; x=1788028620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0BrUF3YDllozzZMX6EDMXsk/rZCZ4fUUH57/usEwGdc=;
        b=dTTWei6wc+N2cLMqYvwRFOFCMuNw5E1XF2Nyr90eMDUVkort/8vMJn/SImIEYArH8R
         30j9qWkQ548fwRr/IPYRCV6M7YlO6t8gyirEkvkG6K5749cq9dl79SPaQOpfhBiLdDyn
         0zuMSoEACRR2AZviEZ/GxgIcJhQrSScIdxP2iT8l38+ycChw6AwXRH7ye9ZQq0n1uiOG
         1+xc2DrWUWTOBchenuZi4fBhmNoZeZ6uimekoGYg2+83KS4L4TT9Kkp9jo2kmn5SLa5B
         bs2ZUJA6LXqvQyvetkWKcxDfruCnxmCcuaiLs+ADejDhxjGbgCmHlMzIGIOTfL7PcMH7
         soWw==
X-Forwarded-Encrypted: i=1; AHgh+RoOfcC7GczrOSweFx52MfE2n4jRlrjO9sP9amLx78sqnq/6rWOy6iTP8kPLXk4fi3PV8nqvAZL59Cw=@lists.linux.dev
X-Gm-Message-State: AFuF++nEjAywdIKWhK2R4Gg4kmIA2m6Z9BYzoB45k/3ijr/Eg1v3jJB7
	MVEXU3+VEVXO0K6BC7fsYh7mdwTwarhr90IoOk1rrqA9VJSqzpPsMaTNhSOPcJ+M474Kc7OeYvf
	cIqCJfocc4XoVSkwo1IFBabjgRqSEfUZRkVR1wEIZZ4FXrvyprA9Cgq6onOgzP/LT3yjlNFSzA3
	8ic6sySk6MI82nu43KZUh/4bhiTvbNxN6NgM/ekIm6sNSFDg4A+UKPWMk/j3xPZeePp1OKoll97
	dDeKMe2BO+ivd/fKmxhyQ==
X-Gm-Gg: AR+sD13HFNJQQERxsrSoKyhFUSgUyJ2OHb7Es9DnbKdiRUw+f3PekoNG6jed1Yci//t
	bfFmPd8kYCj64+Ola2zVqQ62Hntldos5KraM5rBFN+g5b3bS+0IcArExWYlf1oddvwwa/fKifTA
	28nXqb8E/gUeXIAuXNB9zRkQahi4qyZROwlA7GIDOw371L0s6c/g6WwGLLi23n+lCNVo2wo9Alz
	/Ykx/ab1xfL1AeGBBSj2aLrb/IyO1Iia0dGCiBvURWRT8uCmlpAnS+f0pQ/yYgvwmtc5yXZX+4t
	B2Xv4pjCeMY488vncwa8c/RvS9w3tbdYrP0vm5nPGbGPgX3NnYqy6rYQJ+pFjF/97kyem5Ll/HG
	U+TtRmTRrB3mjC+L6zeBJVgVCYBhQmiOj9cQ9KrD3C0LHXZvksTbgYxOMBNoi/RxtrUwheVkQ5s
	VLbUHVKvdxwluOKx4yQQ9tmww7wkufWG0/oF81H5I=
X-Received: by 2002:a17:90b:2d91:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-395c39cd288mr28641212a91.14.1787423819813;
        Sat, 22 Aug 2026 11:36:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-395e4a2fa84sm1392942a91.11.2026.08.22.11.36.59
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Aug 2026 11:36:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccd1958e8fso30012455ad.2
        for <brcm80211@lists.linux.dev>; Sat, 22 Aug 2026 11:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787423818; x=1788028618; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BrUF3YDllozzZMX6EDMXsk/rZCZ4fUUH57/usEwGdc=;
        b=WvAZi+x7xvgMleAldGOkWArMcYXQ70dkCeC5zzlcLXUf3FwToz1lbXwNydxBHKSzLV
         Po7UR6so7i5gjqPnphr89ZBwYbwzJ2/tqmSnAH6dp83ApqHG12VaeCI7sDb47ViAJHOG
         vkbgG3wp3N574R8pRuA/qxFGQJVVsvvIQSr5s=
X-Forwarded-Encrypted: i=1; AHgh+RoFSBmghJEcwZjilfnmXDyYfWhHIU+tmUj5DgxUGs2NuQ2gZOTbLOu4gOtschdmEGEnrzvWcVZNQMw=@lists.linux.dev
X-Received: by 2002:a17:903:3804:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d64b0c5704mr294200625ad.13.1787423817786;
        Sat, 22 Aug 2026 11:36:57 -0700 (PDT)
X-Received: by 2002:a17:903:3804:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d64b0c5704mr294199955ad.13.1787423817307;
        Sat, 22 Aug 2026 11:36:57 -0700 (PDT)
Received: from [10.229.42.78] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm9258201eec.7.2026.08.22.11.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 11:36:56 -0700 (PDT)
Message-ID: <382c3dbb-ff32-4e62-9b79-c6e4cc6273ef@broadcom.com>
Date: Sat, 22 Aug 2026 20:36:53 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] wifi: nl80211: add roam offload extended feature
To: Jason Huang <Jason.Huang2@infineon.com>, linux-wireless@vger.kernel.org
Cc: johannes.berg@intel.com, johannes@sipsolutions.net,
 hsin-hung.li@cypress.com, linux-kernel@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 wlan-kernel-dev-list@infineon.com, jeff.johnson@oss.qualcomm.com,
 Carella Chen <carella.chen@infineon.com>
References: <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-0-eeab4fda0f31@infineon.com>
 <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-1-eeab4fda0f31@infineon.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-1-eeab4fda0f31@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 21/08/2026 09:56, Jason Huang wrote:
> From: Carella Chen <carella.chen@infineon.com>
> 
> Drivers can offload FT or OKC roaming without necessarily
> advertising full 802.1X 4-way handshake offload. Add an extended
> feature bit for that capability and allow PMK configuration when it is
> present.
> 
> This gives userspace a way to provide PMK or PMK-R0 material needed
> by firmware roaming implementations while keeping the existing 4-way
> handshake offload capability unchanged.
> 
> Assisted-by: GitHub-Copilot-CLI:gpt-5.5
> Signed-off-by: Carella Chen <carella.chen@infineon.com>
> Signed-off-by: Jason Huang <jason.huang2@infineon.com>
> ---
>   include/uapi/linux/nl80211.h | 4 ++++
>   net/wireless/nl80211.c       | 7 +++++--
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
> index 020387d76412..9f8d9e3d5990 100644
> --- a/include/uapi/linux/nl80211.h
> +++ b/include/uapi/linux/nl80211.h
> @@ -7110,6 +7110,9 @@ enum nl80211_feature_flags {
>    * @NL80211_EXT_FEATURE_PROBE_AP: Driver supports probing the associated AP
>    *	in STA mode using @NL80211_CMD_PROBE_PEER.
>    *
> + * @NL80211_EXT_FEATURE_ROAM_OFFLOAD: Driver supports Fast Transition or

Please call it NL80211_EXT_FEATURE_FAST_ROAM_OFFLOAD or simply 
_FAST_ROAMING if the name is getting too long. As long as it is
clear this is not for regular roaming scenario.

> + *	Opportunistic Key Caching roaming offload in station mode.
> + *
>    * @NUM_NL80211_EXT_FEATURES: number of extended features.
>    * @MAX_NL80211_EXT_FEATURES: highest extended feature index.
>    */
> @@ -7192,6 +7195,7 @@ enum nl80211_ext_feature_index {
>   	NL80211_EXT_FEATURE_ROC_ADDR_FILTER,
>   	NL80211_EXT_FEATURE_SET_KEY_LTF_SEED,
>   	NL80211_EXT_FEATURE_PROBE_AP,
> +	NL80211_EXT_FEATURE_ROAM_OFFLOAD,
>   
>   	/* add new features before the definition below */
>   	NUM_NL80211_EXT_FEATURES,
> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
> index 44f2bad08670..15731440c57a 100644
> --- a/net/wireless/nl80211.c
> +++ b/net/wireless/nl80211.c
> @@ -18434,6 +18434,7 @@ static int nl80211_set_multicast_to_unicast(struct sk_buff *skb,
>   static int nl80211_set_pmk(struct sk_buff *skb, struct genl_info *info)
>   {
>   	struct cfg80211_registered_device *rdev = info->user_ptr[0];
> +	struct wiphy *wiphy = &rdev->wiphy;
>   	struct net_device *dev = info->user_ptr[1];
>   	struct wireless_dev *wdev = dev->ieee80211_ptr;
>   	struct cfg80211_pmk_conf pmk_conf = {};
> @@ -18442,8 +18443,10 @@ static int nl80211_set_pmk(struct sk_buff *skb, struct genl_info *info)
>   	    wdev->iftype != NL80211_IFTYPE_P2P_CLIENT)
>   		return -EOPNOTSUPP;
>   
> -	if (!wiphy_ext_feature_isset(&rdev->wiphy,
> -				     NL80211_EXT_FEATURE_4WAY_HANDSHAKE_STA_1X))
> +	if (!wiphy_ext_feature_isset(wiphy,
> +				     NL80211_EXT_FEATURE_4WAY_HANDSHAKE_STA_1X) &&
> +	    !wiphy_ext_feature_isset(wiphy,
> +				     NL80211_EXT_FEATURE_ROAM_OFFLOAD))

Ah. _FAST_ROAM_OFFLOAD is not longer than the other ext_feature checked 
here.

>   		return -EOPNOTSUPP;
>   
>   	if (!info->attrs[NL80211_ATTR_MAC] || !info->attrs[NL80211_ATTR_PMK])
> 
