Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0477F3F888C
	for <brcm80211@lists.linux.dev>; Tue,  7 Jul 2026 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423936; cv=none; b=HTqy3Rt1a67g9Rk2cdUifesnghqXO+qqNhsOcaDUJ3L+aEmWoc5kUtowpsyZlQT3OjkYD0Mlu8osBX1NnvX0JMfBcL2A+SyDZKuDJtkHQs8Y2YWiP0nrUsZMUVPfgCFbsUdrlnf2Nxid6D39bqrAGlg2xGUk6YOz8eYUW1VbKCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423936; c=relaxed/simple;
	bh=nnvomAEpu0wEat20NTObqGZb5UC503NtBfolCZLb92M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sHuo+5JqgnNnJuD2Bqu6jUkKl5U+YWSvaTXtntWPFNJoolbiBzOM8QB+8UTrhtR7fpjIHdmMBtWa/gix4J5XMo/lYgkR0D8LXdFSjdDErjY0U2GCvbSCJ26d3rSpvOceA1yn4ZroCVqeQFYzOoeWEK5TEQITxc93kRh5kACajKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dXuZefVt; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dXuZefVt"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2ca70925c25so51382485ad.1
        for <brcm80211@lists.linux.dev>; Tue, 07 Jul 2026 04:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423934; x=1784028734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YJ5QiKQH3VtcXnw6BGy4lgO2MoGjRkeKal0uvLeH+uQ=;
        b=VEb/Ta/noASjadDDL1u8mstLsf54cuDLIPc9nXAu5oA+rLaKeZIGqnYGD5+LqbQdLG
         jfQcMQ3x3qgvhnFTU34NyP03cpk2ffSVQy0HT2SGFvvuZjZUNpO/vK16ZelIndNLLeLf
         3OAc5PD14K4e6cRtNEo2XlOEUR3Z372uBhuHJngyO20s8d9xaxdP65RtL0FlM8YcUWTo
         WLBu5itlglQyozHiau3CXoS88cDDDitkGO/BXT4ZH6LVJxtZ2fEhQbTq6nSND0ZXrb8A
         iMV6FFUeKc7o3QoWff/EKlrSR8akZ67LuyaV98P+VNvn588dLJWZV9IMUiL6radGfq7o
         8+Dw==
X-Forwarded-Encrypted: i=1; AHgh+RoGq8sl72oFPnpnwJ5zpcHz9jVfKmmeTrgxmZ0e4CJBiFktF5gTpjGHMrg/CMxp6tqfAQfmVMDKrFo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yymc1REy33GhrslAPD6mtM5IMaXJUW7FKmmmtZBW94xxxp+VQBm
	sHB8SAKq0N3H0eE/XDOB9m+wn0u7hyYu3BMKs8kXgk9kAT6PHIYeb6rbJrpSheNO3KpFVHJSzLd
	pAyDORSspO9Uac+9qXFL2RgqBorDg0OfMJh4sthef00cZJmb2bSL8ceLawZXGReDk5srgCfUj1L
	dWUNfGOa/EuJ0nkNlu4p11dbMbGGqC1oHnh90oH8HEo4o7sa5X+yuygTxEsDsufqvmo670ty0Qh
	AHkwhxdPs29pTzJnlAs3w==
X-Gm-Gg: AfdE7cmu+0ggQ5cMnmosh+o+XEZZAY9N89rNmFU2WXe1kPN46JLb0eiVCBUo8HQ4JPW
	fC5yO2V3CeLg9clhvlJ7UkjsxScO3t4m7+TDv5NRyPnrJSf2+4iz73t6j0hTxTi25D3M2oyZpvW
	KhavxsVWIFHS3M+SsLtRxSEi+XpqS8wH9JiQgWDA/n6z3MiSsCPlMvEN2AgityYlvBAQVKs0ybX
	GxI98eyjGG2lika/4A23AcbKOKWxbPvfXTTq2gbu8VsgI4wH5lR5rZt19q9vdMu8jluXQp9YLYO
	x4FQAGBMKYZNWCaaSad8ieKhm1OvGhoi5VfbLbLFM+w8dzKHhCX9xn/KFPqJU/h9pCQl3u44kZq
	GgLIJr+PRLLLOkj+TzEuVE2PrvxKaBS9atbZUx4Dcr/sCxQrfuWd+RN8pgtXR+esZv6/gTAtrvg
	rlTf4K50rkudDR0nxGNroOR4LGLu8GeZSURYNiX8kPoAVrdM6z4N2K
X-Received: by 2002:a17:903:388e:b0:2c9:fc14:588f with SMTP id d9443c01a7336-2ccbf05154bmr53931185ad.29.1783423933469;
        Tue, 07 Jul 2026 04:32:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ccc9bde042sm2030755ad.15.2026.07.07.04.32.13
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jul 2026 04:32:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so50900161cf.1
        for <brcm80211@lists.linux.dev>; Tue, 07 Jul 2026 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783423932; x=1784028732; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJ5QiKQH3VtcXnw6BGy4lgO2MoGjRkeKal0uvLeH+uQ=;
        b=dXuZefVt0gvZGgIpS1ppD76h8k928e+SHhBvp9SyUCco4cHIeciKtBxFLbmzP6b7ZP
         P4t3L/DdqV/HLrLkcRh/LrZOuQT/viRySmQSP3AYnE0nKPxXB0BVC/4/b1wuztEJdaa4
         5gxo7QMIUKPVekEPFCNfrk17UuFCMiEVebMJI=
X-Forwarded-Encrypted: i=1; AHgh+Rqby1t5FbFJx4eEvhWyyCIJhtmApiZU2cCOR/0FscJZYoM0TIR1/3Fmoy7X2esdI7buz0vfFBfUu5Q=@lists.linux.dev
X-Received: by 2002:a05:622a:2516:b0:51c:7b12:11fe with SMTP id d75a77b69052e-51c7b121745mr20758691cf.76.1783423931792;
        Tue, 07 Jul 2026 04:32:11 -0700 (PDT)
X-Received: by 2002:a05:622a:2516:b0:51c:7b12:11fe with SMTP id d75a77b69052e-51c7b121745mr20758181cf.76.1783423931150;
        Tue, 07 Jul 2026 04:32:11 -0700 (PDT)
Received: from [10.176.2.33] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d7eb26sm111016721cf.21.2026.07.07.04.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 04:32:09 -0700 (PDT)
Message-ID: <77dfa2f3-296f-470b-8d21-0f10a56a2a4a@broadcom.com>
Date: Tue, 7 Jul 2026 13:32:09 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: brcmfmac: cyw: fix heap overflow on a short auth
 frame
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260707063155.3099999-1-maoyixie.tju@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260707063155.3099999-1-maoyixie.tju@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 07/07/2026 08:31, Maoyi Xie wrote:
> brcmf_notify_auth_frame_rx() takes the frame length from the firmware
> event and copies the frame body with the management header offset
> subtracted:
> 
> 	u32 mgmt_frame_len = e->datalen - sizeof(struct brcmf_rx_mgmt_data);
> 	...
> 	memcpy(&mgmt_frame->u, frame,
> 	       mgmt_frame_len - offsetof(struct ieee80211_mgmt, u));
> 
> The only length check is e->datalen >= sizeof(*rxframe), so mgmt_frame_len
> can be anything from 0 up. offsetof(struct ieee80211_mgmt, u) is 24. When
> mgmt_frame_len is below that, the subtraction wraps as an unsigned value to
> a huge length. The memcpy then runs far past the kzalloc'd buffer. A
> malicious or malfunctioning AP can make the frame short during the
> external SAE auth exchange, so this is a remotely triggered heap overflow.
> 
> Reject frames shorter than the management header offset before the copy.
> 
> Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE authentication in station mode")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Thanks. Nothing to add here.

> ---
> v2: drop the Link: tag (Arend), add Arend's Acked-by.
> 
> v1: https://lore.kernel.org/r/20260627131313.3878893-1-maoyixie.tju@gmail.com
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 6 ++++++
>   1 file changed, 6 insertions(+)
