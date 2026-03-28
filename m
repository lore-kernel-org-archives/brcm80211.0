Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACCD33D6FA
	for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 19:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774725502; cv=none; b=EbPaKrNLizse8dQXnVnVq9Po6hCFKENoeqT2iWQeH0/8ZBP0AaC7eraNg/t3FzL8i0wwIdwkIx+5+0CZM34yzDfybhxqSQvXgg6OsJyszSyuII31qzKVxl/r9uI38sTx+IM0AHeip50rNO6cFn6QZD2gs/MgG3DllKb+eN/vdiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774725502; c=relaxed/simple;
	bh=tQs1ClQrClVJHcSzIehuuDLOW0l4tjAOpKioVlkUUdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYQDuMTtZeG00gt+FmBHZ9DTzL8bl2P9Lu4O7of/2ZrEx+6zxWWxC+xsaj7ClBZIWinten9pXuAB//jlCXR58i3L6FAmmK3MHK82pernJMVXtHrKqPUohUAiudNIHAWPP5AdVyT1NXzOEWEByEmrEoLEa1e9QjnHa5mQPaVZ03A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GzDXcmbj; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GzDXcmbj"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so1321435a91.1
        for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 12:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774725501; x=1775330301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dCzW69THXEF5HvH8lblgi0nh+8npufR2fKyClTNTePE=;
        b=Dvdl0OGaVWppIqHq5b9i+Hi/vGJWfCee8CAcR+nZfmTrgb7ky4Aa4H2VA/3HZjO8sO
         8RJqgbKuRms5Nx5qRNVCG9g44kgs8iIdGLyZR8fF0ZaWixEBcmzccrwt0CO0OflaFRsv
         gg78rNB9T/INLdMDCI2q6Mad0vYmWTntvUWoQwCsSz1SS0mxojakkaQACUxoLLVHaVLX
         v7sG06yAQ7fM0kPUQgrN8WHEbLMgsStQrFHGcz9k9pTougcF7+4B21zSWbA587Uy3aVI
         0/JLFrEBkGlAPLaj3C/MXN+dx6n/3dmnjgMFJCI0VPfc1wPcjzuHy2fF3q2O2dsh5Ipj
         Numw==
X-Forwarded-Encrypted: i=1; AJvYcCWU9W+gbc04mjvA5VgaIDwoJ5dfx2BY0oOQtgVCQIE46fFApKbyIgF0phsIiWo0HCmjwTfUVP5EES4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAVt2eVe1wCLKwNnhd+MFkr5Bx5DCK/MJ0oeLjHOQowa/TvBKZ
	q/mGVJIMxEZ/kBAvQil9VUFGIrWpj84TEqsgptJq/JomBpccs1ID3O/K33iGJBzrLqDcEJZygbl
	KUH52jFpuGp9faoReEzDI6Y+2HZzHtUAOUtUkG2p0Tbg8WpUacAPxzsojO2XIadMwdkgxpuy/nI
	ddgFgCIvlv/5ulA4jHkAjlDW05lODL587niKsQYTVwPCpC9P3r6JSQQ2QHgCEn8j0Nt9gQ5JOvQ
	ryEPsRmqRNQM9sauFAvug==
X-Gm-Gg: ATEYQzwaI5rRZKWkEFD1IMQcrT9tWKIBBWnn8pRzFdjbjNk/nLl3P8nY9vqtwkkJ2hw
	qs25NvjZaGnOXp398dpWC79xsA4M7EaA3pAXOOZ1Ppc1ch8zYCxSoxyg6tAXHtbdI8v/S681CT9
	UMaQqEure+uIpYIWZ27E6CTk25bibrH0STK2NzHUVSVIeQSwKCyjBvPgzJGAkUdIxDNH4uexXMc
	x1SpmnqYEw7oJIK97yzkp19SIqhIEOfO+T4qEI/o1RC0od+86Tx7ZcNkUiQpqdjanQFCNBRMDB1
	vUi0+OsyFlNOwnBO5tsGP+Q6pCFv/f7UFX5ugyQHCuh3+BY31RJ5X3LUhM4VnOC4gEwbirm+NFH
	oIaTZ9s5IYeGYwXq1fB5CJZT2p5HCSG/hmZj7i03tliisxh6VB64fvYNcfki+eE3nia76rAfNG8
	QeeJOXC7Y7HmSt2fUVi3Td9HVO/3K87/r8fyVtcdLxcAeiIRUiZhmxUh6isubS
X-Received: by 2002:a17:90b:4f41:b0:35b:af3f:3618 with SMTP id 98e67ed59e1d1-35c3010eda1mr6716473a91.28.1774725500509;
        Sat, 28 Mar 2026 12:18:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-35d95072f15sm305892a91.7.2026.03.28.12.18.20
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Mar 2026 12:18:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfd0a23243so1246071085a.2
        for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 12:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774725499; x=1775330299; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dCzW69THXEF5HvH8lblgi0nh+8npufR2fKyClTNTePE=;
        b=GzDXcmbjctNwk99JAsYGRNDHhE21h12pMP8swSLAb1ISpeH9u//FxEoW2JUyys0SzY
         UpD+mhttnG51sIo/obqEvN6mZIJ+C2dMMvsgGQoBxVKQx/Z9BSQ7Y15egMNGP2UvYZfA
         4ha6FyuK9Do5I5aCudVFvbakBs0DWkVOrg2Kc=
X-Forwarded-Encrypted: i=1; AJvYcCWy1mODtlEANJM0it/i4/fuVJtIWu3zzULVQAe6RWp138Q0XHyo5EogeWNqzfFwzQ9pvleRyewQxQg=@lists.linux.dev
X-Received: by 2002:a05:620a:1788:b0:8cd:c037:8522 with SMTP id af79cd13be357-8d01c7b705bmr925533285a.45.1774725498985;
        Sat, 28 Mar 2026 12:18:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1788:b0:8cd:c037:8522 with SMTP id af79cd13be357-8d01c7b705bmr925530485a.45.1774725498394;
        Sat, 28 Mar 2026 12:18:18 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027edb8ebsm223819485a.7.2026.03.28.12.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 12:18:16 -0700 (PDT)
Message-ID: <f8eadf0e-6c05-40ed-85fb-316cf4151258@broadcom.com>
Date: Sat, 28 Mar 2026 20:18:15 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] wifi: brcmfmac: silence warning for non-existent,
 optional firmware
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260317111202.1074675-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20260317111202.1074675-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 17/03/2026 12:12, Alexander Stein wrote:
> The driver tries to load optional firmware files, specific to
> the actual board compatible. These might not exist resulting in a warning
> like this:
> brcmfmac mmc2:0001:1: Direct firmware load for brcm/brcmfmac4373-sdio.tq,imx93-tqma9352-mba93xxla-mini.bin failed with error -2
> 
> Silence this by using firmware_request_nowait_nowarn() for all firmware
> loads which use brcmf_fw_request_done_alt_path() as callback. This one
> handles optional firmware files.

Thanks, Alexander

I revised the patch hopefully addressing the other firmware related 
warning that Christian Hewitt referred to. I have sent the revised patch 
to the mailing list:

https://lore.kernel.org/linux-wireless/20260328140121.2583606-1-arend.vanspriel@broadcom.com/T/#u

Regards,
Arend

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>   .../broadcom/brcm80211/brcmfmac/firmware.c         | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
