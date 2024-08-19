Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395CB4964D
	for <brcm80211@lists.linux.dev>; Mon, 19 Aug 2024 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724082765; cv=none; b=BLh1lHg1FNC/wh74RKT1TLm9lD4S5pKr7oi9p4/FkRSx+jRmK45mVniBB0wVCcm9heEcQIziyRpW8luEeuAjnInB7ehm7MhCHZBbPVAUoH2YDjYVogTz6De0dJaoVEJe+Bsz6Q3DSB5n3XHGfCYbDnRdC8lcypgv42jj2PwSQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724082765; c=relaxed/simple;
	bh=Q7bJiVRG7liKTZBf0PjHSKqqS8kz/az3WbqO91obieY=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=j/cWCR2/Dr86mvfrV/x0TjSNHh+AO8MIxVfWAn5W4UDUDeR+x4FOXvI1kEzkB+HIqN7Y7vZ0hX+bZKFf6HiJiorVRYXgNlHxEf1XNv2Zp8LEIdhErIUbV0b8B52CfShNw5olBwUCxFC1Ysc3yAmlDUrtFJk+rystQUb+8FOefcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=g+ZkGcjv; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="g+ZkGcjv"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3718706cf8aso2858992f8f.3
        for <brcm80211@lists.linux.dev>; Mon, 19 Aug 2024 08:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1724082762; x=1724687562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4RzSWJA3xUP/23XsRcXEBJL0JfqNAW5dNBSPD0qir4=;
        b=g+ZkGcjvhuj00vRjDC8Ez3a0fxs+uczkWAIISN81sHCmNM88fQV8BcsY2t5Q/2nPij
         nQ8b7LJd/RrCuQRC2dIZUJD0yUGQtVwMo2MB7YuU1oE/RHsdc8AlGjP2rnW6b1U25W6t
         VGAYT8ot7rbd/gKz+iNJuw6fxi1BnPn2pEoFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724082762; x=1724687562;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4RzSWJA3xUP/23XsRcXEBJL0JfqNAW5dNBSPD0qir4=;
        b=TbmxreAWv+C0QpaTCLxHrUGBGaKoolNlznEuQ9Wab88huZIbH0treETui3rXcw2WO7
         LBmpJYzM82b3bWIdWrsqQgwqRnQRur0L4R8Iv/NxNl49+Dfc+iesAzSL6DTmZ9F+zIXO
         4asVYVPskjqnhrtpGm7k8EBFy5NvXFPq2Wz/D1D/kDlo9K5vCv1yiEInQwlUUk5df+yb
         4evKB2S5PoCdTbrA1+ngcoJ7Opkx8NG2p6IbrJ0ESfKQs1yoE9MmcntCUVHA65blDFS9
         LYc+zEsU5/nkHnHkFH8OS4jtO8AGrOQoceZFbKqbUhIPXLgr1kL/yk3Z2dVHFNFYpt9P
         YVOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsqeV8dPnLeeu6gHJ7PGDO5n5i4v769uJZGcR4lKwvXhTsxl6CeWEumhJT8OeSrIwrmakGI1YTc7399MDOzOfuUEFpOakI37eO
X-Gm-Message-State: AOJu0YyA79YiWS6JHQf62UDqfcov2PupnJuvIPA9+PqBVmF3OwbAXxmw
	6LVz2SstVSGOUBYKWWv4inoLPPb7rA1UcH2ggQ91j2oZhgKwuinYiIT2LmMxlw==
X-Google-Smtp-Source: AGHT+IGW8oAqkMSHkpuCNV4nfLQQ7vz+yfoDUOn5qpGNhEM3JUwcTDHEUZap/RaAsTKmplRWZ/snUw==
X-Received: by 2002:a5d:6385:0:b0:368:36e6:b23a with SMTP id ffacd0b85a97d-371946c9ad0mr7268298f8f.55.1724082761901;
        Mon, 19 Aug 2024 08:52:41 -0700 (PDT)
Received: from [10.229.42.193] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898abf2csm10770266f8f.107.2024.08.19.08.52.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2024 08:52:41 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Kalle Valo <kvalo@kernel.org>, Marek Vasut <marex@denx.de>
CC: <linux-wireless@vger.kernel.org>, "Chung-Hsien Hsu" <stanley.hsu@cypress.com>, "Chung-Hsien Hsu" <chung-hsien.hsu@infineon.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Carter Chen <carter.chen@infineon.com>, Duoming Zhou <duoming@zju.edu.cn>, Erick Archer <erick.archer@outlook.com>, Kees Cook <kees@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mathias Krause <minipli@grsecurity.net>, Matthias Brugger <mbrugger@suse.com>, Owen Huang <Owen.Huang@infineon.com>, Ulf Hansson <ulf.hansson@linaro.org>, <brcm80211-dev-list.pdl@broadcom.com>, <brcm80211@lists.linux.dev>
Date: Mon, 19 Aug 2024 17:52:40 +0200
Message-ID: <1916b572558.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <871q2ky3zm.fsf@kernel.org>
References: <20240818201533.89669-1-marex@denx.de>
 <871q2ky3zm.fsf@kernel.org>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: [PATCH 1/2] wifi: brcmfmac: add support for TRX firmware download
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On August 19, 2024 4:36:05 PM Kalle Valo <kvalo@kernel.org> wrote:

> Marek Vasut <marex@denx.de> writes:
>
>> From: Chung-Hsien Hsu <stanley.hsu@cypress.com>
>>
>> Add support to download TRX firmware for PCIe and SDIO.
>>
>> Signed-off-by: Chung-Hsien Hsu <chung-hsien.hsu@infineon.com>
>> Signed-off-by: Marek Vasut <marex@denx.de> # Upport to current linux-next
>
> The commit message should answer to the question 'Why?'. What's TRX
> firmware and why do we need it?

I looked over the patches, but did not sit down to comment on this. The TRX 
firmware format allows multiple images and possibly compression. Not sure 
if Infineon is using all this functionality. This is probably needed for  
55572 device support (patch 2/2). Turns out this device has a bootloader 
that the driver has to talk with and that is probably where this TRX 
support comes from. Not something I considered to happen for SDIO and PCIe 
devices. There is always a puzzle to solve ;-)

Also noticed a random seed is provided to firmware. This already there for 
apple chips so it should be looked at whether that code can be shared. I 
will follow up.

Regards,
Arend

> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



