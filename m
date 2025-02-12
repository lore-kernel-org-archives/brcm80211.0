Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6920FA94
	for <brcm80211@lists.linux.dev>; Wed, 12 Feb 2025 13:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739367744; cv=none; b=OCI5Oj4DMbrlgtE7W8mLZOM6j0eqjV5q65n5Fnb402zP5Jl0r6M7hVtX5+OBel5ZNdJ9hKTcLzUI7CcELFq99KcMrBtOxogeQM7O0Ccc84GvK61oJHnZmHJ2eJc80Dua10J04FF2HQLDZJMBtojArerzu06qIdrr7WvG20q76MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739367744; c=relaxed/simple;
	bh=Z0fxZBAzfIYmUMXhU2cA1/PmrwTC6A92uK2aSyK7QNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fc6IsitKVRZcjHRTtkwDGQc6BooFm8nnCGYBY5sVh+MlvAd2bcmxT4+mKVWUQSffmITB/Ua0ExiVVq1yKoJeFeZoCaBdJXndZDFE7pwg/VbgUy9QxMmikZtl6f/C+V5HIqh+3iawkKZ3MndO1hbOx7fqmGUBAG2Y5pHyXGopPOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DP2Eig9G; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DP2Eig9G"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e44fda56e3so8292486d6.1
        for <brcm80211@lists.linux.dev>; Wed, 12 Feb 2025 05:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739367741; x=1739972541; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgqcJMrN+oO4Lcfjo9FO29l2+bXN3T74siFMzmQQ8Ps=;
        b=DP2Eig9G8wMndVsjtEeb54p+ZAEXgSFLhs103QcuhM//dC6BekbuKFsc/kAFxL9s0U
         81CAxaD+Dyw9CH7LAhwCWYix+d0joDIKDqY0HLvs4HEmTTZqbXBXFcQ05NnTTr6SXBFr
         dcPQg2tlII3oLp+syKXbdsU3vTl/PlvbTSnREwdVpfKZNQwjFujky/+BqlM75p6ZFpdQ
         c8e03n3DNRDwFJBqLhE5Iks2FezI5M+URYjYN4OPIDV5OtDhIONnnV2kEUyA9a/BpQg9
         YerdCQF6RUjSaJGWet2AJg5eFLfU5JeA/iSqByDn0VxPDA7hDzPxhqt12ZcFTzDQrR7T
         BYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739367741; x=1739972541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgqcJMrN+oO4Lcfjo9FO29l2+bXN3T74siFMzmQQ8Ps=;
        b=wuoNyeGgCXFKry1IhyHRNo1zXHGglkyZXghYSsWHw4lkS/l2jzUAbzPi0mREpzJ3u7
         JBfFITKgtnc6wYtoNql8VuzagkclmEc/H5EEc4R8Q7NQStT/qEhX5xjciRDsGSttQRtv
         vrx5i8BHxOuUinKFF4vr6rhaOzPA5b2RsswzctfsXgFki/MSKMW69G72NruvE8jEVAD5
         WTuKjbAC87ytxGKVWcRm6YkdufCwUYNcJhvYvmOWULQwpVf6hWf9INAB4vEBIgbBfJNN
         nRFkWYKPvOJxIGRS0yg57ZcHA019yxoQFgKGsbJOL1NtvUZ36RHNN0M3sDdQHDtLvBwY
         48gg==
X-Forwarded-Encrypted: i=1; AJvYcCVnmM6qSO2rQTUj7zbZSbR7vVP/AusFKLVbFUPDlaeCTrNTK/puCYRmgDmb1hKeH3vRSSZLyAQSVMQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8P57vCG+FHWEDRj72ai9gXdENuCWy+XI5Oaqc2vVej4wGYibv
	z9p6sLrggkBuOEoLPMlHxpXWBvYa15072k1CHJW0pRu68TJ+5Qxv
X-Gm-Gg: ASbGncu5M4CGW/4r5H6vgBPRi19kPIqCXVz8EKnD2KqwTT5RVWfCfcmY2RB0r3ditvM
	oBx8Jqdl2/Gu5TLhhTEQojIcns6BPSb2VTLdFN4cPOwZwXwMZSoSCs8JQrN0T5sJYg+9FgMy9UR
	YRCTGo5Dmg7N/kcg/8nj5zQU7z+gEI/oUmNifS7nNmRFpM9tM021S/WAiAY4uhBzLfL3pP2BOBk
	yBQFDFqrElLNIaBsyVO0atbfsTH09oyk+uc78NYopP6sKZluUimzH9TQiSBoYdyemFo3nKW812E
	SGpWfNsFOJIVVvXYUMc=
X-Google-Smtp-Source: AGHT+IGvLi0Vi9L+OJ7SRIrHcZ/sC6Mlffs6Z6HHzv/IgRwyJcIWLK5MakJyGmFrnokUQyGDt0+M1A==
X-Received: by 2002:a05:6214:2481:b0:6e2:4da9:4e2d with SMTP id 6a1803df08f44-6e46f18da31mr47019176d6.9.1739367741469;
        Wed, 12 Feb 2025 05:42:21 -0800 (PST)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44087b4afsm74860386d6.19.2025.02.12.05.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 05:42:21 -0800 (PST)
Message-ID: <69874369-495c-4698-af1f-502d21371f7d@gmail.com>
Date: Wed, 12 Feb 2025 05:42:18 -0800
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT] brcmfmac: Fix structure size for WPA3 external SAE
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
 KeithG <ys3al35l@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 Ting-Ying Li <tingying.li@cypress.com>,
 Ting-Ying Li <tingying.li@infineon.com>
References: <CAG17S_NqbLogvTWyoYobZ6kOpfXHnScfm4-dB1EqsmpB+q+zxA@mail.gmail.com>
 <20241215120401.238320-1-arend.vanspriel@broadcom.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <20241215120401.238320-1-arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arend,

On 12/15/24 4:04 AM, Arend van Spriel wrote:
> From: Ting-Ying Li <tingying.li@cypress.com>
>
> Add pmkid parameter in "brcmf_auth_req_status_le" structure to
> align the buffer size defined in firmware "wl_auth_req_status"
> structure.
>
> Signed-off-by: Ting-Ying Li <tingying.li@infineon.com>
> [arend: adapted path to apply to per-vendor variant]
> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> ---
>   .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h    | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
> index 18129adb5dc2..1cbe66526d82 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
> @@ -54,6 +54,7 @@ struct brcmf_auth_req_status_le {
>   	u8 peer_mac[ETH_ALEN];
>   	__le32 ssid_len;
>   	u8 ssid[IEEE80211_MAX_SSID_LEN];
> +	u8 pmkid[WLAN_PMKID_LEN];
>   };
>   
>   /**
>
> base-commit: 1cac3bd863bef434d43e6b0554ac5d7f7f6350fe
> prerequisite-patch-id: d5b3eb93d54bd6a0508a91f4627ec3e59a810928
> prerequisite-patch-id: 653281e1349a038c7f48b3513243f3211fffab9e
> prerequisite-patch-id: 0e47ab711ef159237e20c860834d3ac269b05eb2

I've tested this and can also confirm it does fix external auth on 
brcmfmac. I adapted it to work with the upstream 6.6 raspi kernel and 
had no issues using IWD + external auth to connect to a WPA3 network. Is 
this something that can be upstreamed?

This is the firmware I'm using (no changes to the default raspi distro):

Firmware: BCM4345/6 wl0: Aug 29 2023 01:47:08 version 7.45.265 (28bca26 
CY) FWID 01-b677b91b

Thanks,

James

