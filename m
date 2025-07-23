Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1797A290BD5
	for <brcm80211@lists.linux.dev>; Wed, 23 Jul 2025 11:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753269208; cv=none; b=HbXOPcPWL/NGFL0lirpzyN1uj0Fd2TrByirP/4Pbtqbt86RfVA1cRSczZe7dyDc6UnPj1FX+Cn3N5fADL6XkBzmRpDHeNJw94nPAIlUOZHAJVmIQrYJLv9M5GnJEmYW6lZIP2OoEoxofaKLrGTxwwhO8ieC3K0FHfXsk+7tbQs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753269208; c=relaxed/simple;
	bh=41O+153xmJgNdu1ZJTd1Wvjw6XQRDIcFTlK5QmAzPFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQmbA2+UePB8iTh4wVQT4Ig7GTLldTR5lERijYSnKSuXiAlKoHLrH6LNyCBol779O4YT6HCLiqXx1qQ/XOoP2+garTZsf4BekcdHUjpn+NgenetcI5n8SNktbLrBHMLKCoEyQB+4RwHqBoRoE9T0vU4EH2pmUVsoqZGys06k0BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ex/uZ1xl; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ex/uZ1xl"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ab58105261so118960971cf.2
        for <brcm80211@lists.linux.dev>; Wed, 23 Jul 2025 04:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753269206; x=1753874006; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XvgmGBaWE2f+k/MY6pGjbltcZz4rXWd+ofntlB6TQl4=;
        b=Ex/uZ1xljrUXMn+Zk+0QBGQBWkHLjtJQr2ULpLLrAjXvJU3B+18KMOlfnXKzCSNusv
         L5cpJD072rKoOe7g4iGP7/BAKJsiYfzbX9hLth3UaHc6Muy7OEneWOxsWP2XVx/2EAJ7
         +7cbkL8PrxQuP00HtJcrs3xKohGouUG0jqp8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753269206; x=1753874006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvgmGBaWE2f+k/MY6pGjbltcZz4rXWd+ofntlB6TQl4=;
        b=aPOV23hHc80Kf5vntO6qkP2NfsmwYSTykpyF4I5xzKxzMY9ZvhKWC6Zm97h8f2W9Ep
         SLoL6e1nd91bAhS/S0krJ+TvmJO6oGk04sYfIgufUsi/pBSx52PsRfiHc6ENSzOqw54r
         0WhanGD5O0eVA72nc7tkFi7ZW4JJBSEtXOI11Qw3u3elT4XcJK1ztaJ904ipvK4PN4Uu
         +8XI5V9e+qUcABoDV6n9KTCAae/0XqU4ms8b0Su0GMU3c0+fkzQPeX0QSYT1tKrlozZd
         yfypOTZhDMHgnk2P4KxWefLfMTEsPbNcNjnxRxM3RCKK7vwDKLSxp+S8z5LRkFfoHv5k
         yuIg==
X-Gm-Message-State: AOJu0Yy5k6GAR1GQIMxB8rgXfYP+Q6cBBnkov0YevFOCh4T8WV5FRLYK
	lVTZeXWViENYLAvDnhwmu3fxlzNGM+dLW8AXtIuynqLrSDOk+ubcePPv0V1guV1PEA==
X-Gm-Gg: ASbGncvoAsT6yeDkqcSBR7o9NYrtL/xswc/sEF3SEQfLVpPbgO40dVYxVXvv9mfmKQQ
	R5A4J5Az25cgaS5fOq2Hmmsk/PGLohLK6k1sE6eEwF6uWa+vRrKhflnKroyrv1/RqcGiKHwQlYH
	GKSuEwS+cV7SHJ7DBSyznnGM4Ff51UTBgy2Ys+YKjitQ6pgjzdd9k5flxzj0ehCo0JEzLdCf0EC
	BKgBCLZotS60PXZqqWcR1NtWHcVR8gclqY7aNLsVXHmeYuhsdrgndXrowgiYdfYudSfJuj3tIlf
	5DG94cUy1t1PDZZf1asa0MsoNHmiMVS2trwR9HZL8SssFt/KwSldVl4wx5oaODaTtpom93sIA1d
	JJOABrORnIAsWtw5X9KDkMhOapsQMj2y3mLq1tt4pZrgkqzNmM1TemlakWyjtoYA=
X-Google-Smtp-Source: AGHT+IGoNF17MdvxYORZ6QH6kCq+U/AOPAufEmn1e0CkaBnBRISl28TUvJZQmz4XrfJd57ecG90D8A==
X-Received: by 2002:a05:622a:1207:b0:4ab:7e22:8553 with SMTP id d75a77b69052e-4ae6de99a0bmr29387191cf.12.1753269205859;
        Wed, 23 Jul 2025 04:13:25 -0700 (PDT)
Received: from [10.176.2.145] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abce0bbfdfsm46979931cf.9.2025.07.23.04.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 04:13:25 -0700 (PDT)
Message-ID: <d0a74192-472c-472b-a5ca-bc8700d63003@broadcom.com>
Date: Wed, 23 Jul 2025 13:13:22 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: brcm80211: Remove more unused functions
To: linux@treblig.org, kvalo@kernel.org, linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org
References: <20250626140812.56700-1-linux@treblig.org>
 <20250626140812.56700-3-linux@treblig.org>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250626140812.56700-3-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/26/2025 4:08 PM, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> This is a subset of unused functions in bcrmsmac phy_cmn.c,
> They're unused since the original 2010
> commit a9533e7ea3c4 ("Staging: Add initial release of brcm80211 - Broadcom
> 802.11n wireless LAN driver.")
> 
> Remove them.

Tested on BCM4313 card.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>> 
Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   .../broadcom/brcm80211/brcmsmac/phy/phy_cmn.c | 186 ------------------
>   .../broadcom/brcm80211/brcmsmac/phy/phy_hal.h |  12 --
>   2 files changed, 198 deletions(-)
