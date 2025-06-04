Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8CE2153EA
	for <brcm80211@lists.linux.dev>; Wed,  4 Jun 2025 10:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749032766; cv=none; b=arrVO/ldtONUa7+1Z26r0D3Xe+gf/PMO5AEz02/V/zFSwH4kgW5wXf7Xfj4/B5nNLzdejTe4Wm2hlkpVlrZ7djcf4BTXFGGj5Lre6RIXikEwIvZx7DYf5MAk/e5e68jiX9eAl9jQ5bWgAiHHGBmhhjarQWEZ76nhn/brR188ewo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749032766; c=relaxed/simple;
	bh=wgDJdZtOuRzzk5m032hZ5p7H/vYrbO9s+VBX/YQXq6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MbdYGlQ0IL23xeL9LcitoCymuc2aRDQ98ttSscyJO8h68Az1o+edJOSjnpAKofXBJ2FgJ1o9cqruunAsIAwalz+TZqHWZZNYusGJ7LNOK8C8pFctu6Jo8wL3zmVfHOMuUDHmtNpHFGA8Gz9l79la8ybCPzJuXMRQ1cq1oA5itII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NWtCd/I1; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NWtCd/I1"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747fc7506d4so1640689b3a.0
        for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 03:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749032764; x=1749637564; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hebA46kmAbzpBHa7BoBZwTkz2sVwPjWT7q4k6utX/To=;
        b=NWtCd/I1733pZJ/14WL8z3J5Skk3LFzZyWEP15D5oyK5Syxgaciv4do5kHVOrRaK4M
         E0IryTBGiaNwSI740WO0FbYv4R7FLB/FVfacLF/BoRabEO0kdTQazj1PzEQUrT+qdXRp
         pHaL+b9bnoWRpFtTJfSEGUyAmp0C4nkGujqsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749032764; x=1749637564;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hebA46kmAbzpBHa7BoBZwTkz2sVwPjWT7q4k6utX/To=;
        b=TTWzg98blTaWYARIRwlhPLJxbu9mYYuff1g+Px3Oy31v2Sr8iXTVRxBXtLLIEUZg/0
         4HhmJh2b++xQSipd10MmEOSqkzTKcgXZwxWFANZ/EfwoyNOLhDmdNsWkGKdy57YPd5E8
         0L5Fl+qz1/SKdMhBdRmysK4mE6l7uOxt2K+F5HT7rZZyZzefbxfnlroBre55QMftqcxF
         Obb10iooa3SPiHTcu3YZvqvycgiN9Oaqflahg3UrH/F2Cr2TKHBWHLXzAFCvpLalMmBI
         1MIEzDh/TLBP9RszoD+CTSMZHVXZMb3OqUQYhLv1s3H2JsygjfYKMh0He/kW5Rkz2EHv
         tDdg==
X-Forwarded-Encrypted: i=1; AJvYcCWul927MzjXCghViRJSZ7hoOkh4BUoMrN7FjBlvKvtHiUQWdwOKOay5MgupKoWlhsqVKMmxnSdg2wk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVjG1XpJLggUQrmEaUypzxOi1GF72Y2yrYKj/j8z2rp/BlMeAm
	UPwzXptGlYOoJR4vZJTvMEwX+8lFTQjyTmNX/m/+TbPxInbKH6aCehpgQYDORSmKsg==
X-Gm-Gg: ASbGncu/CQBhrjTm1sz0pNXZ79LgCpEF1GnwQ2sbyF+N6qipIwSwZv1IkkI/5xUHY9x
	COs/e2D8n9PTfto0iURUbi5LDhrrJ2Bqx3PiefYTo2ILbaxnajK+5UeI6KeMGFxoKydhwGTeJci
	u7f60LbAqU1CgbP20j86lGUu02IqEAT3QnWyWDncBIZoPZd46Jx8W6TYqoBPg68AR7WvMJ37K/n
	XloSU39Bqhs7N8LQVMn19+KDGZNowVqMxqnsGat8KspH/LLRpvevV3H6laxrnFcZV6Yj05KkuY+
	RuE2wUJ4DnxBc8Fw3sHyoiSc7qX95V9z2wzHiFffHb+21jVDLSSLamfoPFgqOjsnYht3HdgL3in
	OiEyLsI3G6E+f7CsEL5XyJuzi
X-Google-Smtp-Source: AGHT+IGrS+tOgY/IKJooK+wvdZcwa9trFxsMHaaj5JdIgpqu7MvgzRVVUemmSl334yGsSJjfQbvQHQ==
X-Received: by 2002:a05:6a00:b81:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-7480b23acb1mr3791296b3a.8.1749032764222;
        Wed, 04 Jun 2025 03:26:04 -0700 (PDT)
Received: from [10.176.3.8] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9d1dfsm8437134a12.55.2025.06.04.03.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 03:26:03 -0700 (PDT)
Message-ID: <1b15a15d-d02c-42af-a628-a8543ffdf528@broadcom.com>
Date: Wed, 4 Jun 2025 12:25:59 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next 4/4] wifi: brcmfmac: prevent disable
 controller in apmode stop
To: Ian Lin <ian.lin@infineon.com>, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 carter.chen@infineon.com, double.lo@infineon.com,
 vinoth.sampath@infineon.com, gokulkumar.sivakumar@infineon.com
References: <20250604091629.3943-1-ian.lin@infineon.com>
 <20250604091629.3943-5-ian.lin@infineon.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250604091629.3943-5-ian.lin@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/4/2025 11:16 AM, Ian Lin wrote:
> From: Ian Lin <ian.lin-ee@infineon.com>
> 
> Wpa_supplicant will firstly call scan before start apmode.
> In mbss case, controller will be disabled during stop apmode
> so next time it reports fail in starting apmpde.
> Fix by removing the disable operation.

The function brcmf_cfg80211_stop_ap() is a bit tricky. The flag 
ifp->vif->mbss is set to true only when there are multiple AP interface 
and only for subsequent AP interface. For the first AP interface being 
created the flag is false.

Now looking at the function I suspect there is an assumption that each 
AP interface will be stopped. So for a subsequent AP interfaces is will 
do a BRCMF_C_DOWN and for the first interface it will do other stuff 
below the if statement follwed by BRCMF_C_UP.

Clearly you are solving another scenario here so could you elaborate on 
that?

Regards,
Arend

> Signed-off-by: Ian Lin <ian.lin-ee@infineon.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> index e23cd6fc0f56..b4078e74f135 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> @@ -5392,11 +5392,6 @@ static int brcmf_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *ndev,
>   			profile->use_fwauth = BIT(BRCMF_PROFILE_FWAUTH_NONE);
>   		}
>   
> -		if (ifp->vif->mbss) {
> -			err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_DOWN, 1);
> -			return err;
> -		}
> -
>   		/* First BSS doesn't get a full reset */
>   		if (ifp->bsscfgidx == 0)
>   			brcmf_fil_iovar_int_set(ifp, "closednet", 0);

