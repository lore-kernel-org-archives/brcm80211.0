Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E4C7260D
	for <brcm80211@lists.linux.dev>; Sat, 19 Jul 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752930615; cv=none; b=lBTkwQic4fu+q1mhVUjO+RZ+DWCTVvS6BSHusasvt9zQI95fvBf4au0kypZQCqLvFLhl9mt1YmikHUnYUsyeR8lmVtk01dAzXfRB6lQ6GlELbmeIGNIPpA6o9NVLZ6+Ze2IPrf+7oQyYX+z9edBmU6abPrrr1JZ+vP9szJsIuyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752930615; c=relaxed/simple;
	bh=8SGl7r65wEVgyZ3SjxUwL8eWFzfmZy4H+rf6w0b/N8o=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=kWQVWiNdIxRC7WU5yHTV1kj0ys6DJ9+xvcB5s83MH7JZ7zWKZ68M1fjTZJjgZJ6/z/aUKE8a5ODqEmM24IucCSmZR7w+dYGT2qzW4mUckpdA2oVBMFvAXqxLk7JKrw4NdV+G8LlgzpbY4Ru+Jp7DV0KWk3uLwbQ7I++9gTEtlkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=F2uDjpk4; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="F2uDjpk4"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso5288416a12.0
        for <brcm80211@lists.linux.dev>; Sat, 19 Jul 2025 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752930612; x=1753535412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJDpncAmbJKu1kr3LNcv6DPuOBIpHS6OJlJ+9JXb1xY=;
        b=F2uDjpk4fHOmL1dnudn/4kVIF5shvV5zbMw/519Ss6am2yRx8oIlaiU8RDGJleyGnG
         yR1aIStsr9urGTHmdvNDqm2rnCyNMB4EvQmvCj97N14P4g424cGiH8zX6IzTAOTZwNLc
         /ecrjvi+VkZ/fP8ybWFUFJ9zu47u5s3rszt6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752930612; x=1753535412;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJDpncAmbJKu1kr3LNcv6DPuOBIpHS6OJlJ+9JXb1xY=;
        b=lGPeMuuT5L2D9lGCQP/ff5n6ECG4jcXUsX+/9KjiNAbI75zLsJ0eF3zVdzSsoUKE9R
         3NFf8+BnIp4+zjjXMx6m20F5U5x7tUWnQ8SyT78KVqK1dx2+IAboWtnAj1NSKv06p3qm
         0ABUkzWmsxkwlYyIA1Fcxrbr8+GwDVbhUpsUyUlt6KcKeyK1+JLmyGoYnOD/YX3L1liU
         Pu+q/pibNoRfV4fojlJniabqGFDFkk82P4UgYtDpM1/7KhXl0fRRUpm9IZAwcWQcineX
         n0pjMtlWgRfmRajFAiBs7ia6EqujooowGuboE63gjwWYCxdFGpLGDgA8n+1Q7pvusIn8
         jWgA==
X-Forwarded-Encrypted: i=1; AJvYcCWBg3OA5xZnnlQi7CUakCr/JOPm8iwubycHJiaTxSgihA9vXa4jsfi703cg6HdKjs1/e2IndgcP3fE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNUcBtOA00e6KAXkl1GBdR7sWTMhBsIrkfnzODH+4D4v+hq2gI
	R+Gu3giGG9HQhhNbuQcftQ/tvxPJK+ImP65drQAcd3pM5EcH/3eUYJyM2ocIOMvD6A==
X-Gm-Gg: ASbGncuyMO5sArU262xa0gtrvRzBtg3IijgRQTVmhA2xjchvYUR6kAptPytfz1P3CuB
	KqLz0mRG6JLbsjTMRZtbBTYj7oeyadrcc5MoEF2lWzIbr+j66Del0erAv4V00v2xxjt86tLLZHA
	AT4sP4494yd3a7fQUPByNE9EW+BD7iW1v/XusU/n8IrsftAyLAGcrnLlM/mub5SDtMWKBGdzuxz
	yrGaNm5OPx7wmvCuhq0vkwKk3BfcHci6UsXQcVoeVfM9vlFH4eK3im1mW8XRLW0iCF2fYPsc6jW
	0MZposueiz9p8xVuzF0q60tOmW85uhYIGgnP+9QKzOSvXapr1i3uKCt4dfTPJaexyUjY/2O1LMB
	cw9H2CDimf4nEQm1MyCmrHrb6WfYmDtGE+fHImdkcg0QdqlaXM6/V+MKUeA/4usa5jJSq6yo=
X-Google-Smtp-Source: AGHT+IHvTuWbAwAWdDAC+dFHxC6tFVTmU1n2PXejwG8LX6Dyq9sGIapdMJ7mFFZ8/uR6gvPbc9KCyg==
X-Received: by 2002:a05:6402:520c:b0:608:a7a0:48 with SMTP id 4fb4d7f45d1cf-6128262b18dmr13395215a12.28.1752930611917;
        Sat, 19 Jul 2025 06:10:11 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8dea633sm2519414a12.0.2025.07.19.06.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Jul 2025 06:10:11 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>, Johannes Berg <johannes.berg@intel.com>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <wlan-kernel-dev-list@infineon.com>
Date: Sat, 19 Jul 2025 15:10:09 +0200
Message-ID: <19822ce6768.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250626050706.7271-1-gokulkumar.sivakumar@infineon.com>
References: <20250626050706.7271-1-gokulkumar.sivakumar@infineon.com>
User-Agent: AquaMail/1.55.2 (build: 105502562)
Subject: Re: [PATCH wireless-next RESEND] wifi: brcmfmac: fix P2P discovery failure in P2P peer due to missing P2P IE
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On June 26, 2025 7:07:23 AM Gokul Sivakumar 
<gokulkumar.sivakumar@infineon.com> wrote:

> After commit bd99a3013bdc ("brcmfmac: move configuration of probe request
> IEs"), the probe request MGMT IE addition operation brcmf_vif_set_mgmt_ie()
> got moved from the brcmf_p2p_scan_prep() to the brcmf_cfg80211_scan().
>
> Because of this, as part of the scan request handler for the P2P Discovery,
> vif struct used for adding the Probe Request P2P IE in firmware got changed
> from the P2PAPI_BSSCFG_DEVICE vif to P2PAPI_BSSCFG_PRIMARY vif incorrectly.
> So the firmware stopped adding P2P IE to the outgoing P2P Discovery probe
> requests frames and the other P2P peers were unable to discover this device
> causing a regression on the P2P feature.
>
> To fix this, while setting the P2P IE in firmware, properly use the vif of
> the P2P discovery wdev on which the driver received the P2P scan request.
> This is done by not changing the vif pointer, until brcmf_vif_set_mgmt_ie()
> is completed.
>
> Fixes: bd99a3013bdc ("brcmfmac: move configuration of probe request IEs")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
> ---
> .../net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c   | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> index 4b70845e1a26..075b99478e65 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> @@ -1545,10 +1545,6 @@ brcmf_cfg80211_scan(struct wiphy *wiphy, struct 
> cfg80211_scan_request *request)
>  return -EAGAIN;
>  }
>
> - /* If scan req comes for p2p0, send it over primary I/F */
> - if (vif == cfg->p2p.bss_idx[P2PAPI_BSSCFG_DEVICE].vif)
> - vif = cfg->p2p.bss_idx[P2PAPI_BSSCFG_PRIMARY].vif;
> -
>  brcmf_dbg(SCAN, "START ESCAN\n");
>
>  cfg->scan_request = request;
> @@ -1564,6 +1560,10 @@ brcmf_cfg80211_scan(struct wiphy *wiphy, struct 
> cfg80211_scan_request *request)
>  if (err)
>  goto scan_out;
>
> + /* If scan req comes for p2p0, send it over primary I/F */
> + if (vif == cfg->p2p.bss_idx[P2PAPI_BSSCFG_DEVICE].vif)
> + vif = cfg->p2p.bss_idx[P2PAPI_BSSCFG_PRIMARY].vif;
> +
>  err = brcmf_do_escan(vif->ifp, request);
>  if (err)
>  goto scan_out;
> --
> 2.43.0



