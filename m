Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5293C0A02
	for <brcm80211@lists.linux.dev>; Wed,  7 Oct 2026 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377663; cv=none; b=EUY2J+BlzGLWWvCfzOQLridcFW3fooBNwAf2YyMPtNPg1GiF9tzITTth1Ky3EUQoJxsaLh1uBCdLyoslo6AQJBTPjd30dzDx2WMAieYIO15NGmpLd190nD9KEIoiaQpQO3u1UUXVF5K7unyeCf7S2MCTZOz1NdS+i9Cm3ChDAmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377663; c=relaxed/simple;
	bh=vQ5ti0IRpJKxnO/ajOgsAv5J3ZdzP6Vf+7alXOHlJ2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7K7wk4sRa0FDY3Ou2vjb8BBt1gcLBbcWNm5r+/aUS5NQRLvuEYUVOIvNmXzTPHlYOcD7zJc3obNZe0eABaPBFCdIGKRaXL6GcROyRvWPWlUxLCgM3+C3N3sWckApL0iGNorhmLmZ1ZWOrh5RhnL7KneH0MYl/+lWM1osohAXF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=EkQ95eLZ; arc=none smtp.client-ip=209.85.222.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="EkQ95eLZ"
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93cbc3ab2fdso188139485a.3
        for <brcm80211@lists.linux.dev>; Wed, 07 Oct 2026 05:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377653; x=1791982453;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WRr2bOzV+ACM051eiPZmuzY0jHiw8RpNfmmijxyyZ5s=;
        b=xucJrVMlF3u1rVW9BQiyMHGSlhSj3UR8V9G9mpjHSNgHfUnMZ7PqMZD1De+ASFRh4f
         Tmzn/Gjns4SRHdW1jH/66BpRsaihbBq0V6Dy6ca5ayJGMyz3173aZTkl/y3sapfdGE/w
         vYP0B/kBAmA2DaIp+AHcXUWdjJ++qv+Hbd2Q1cVfd5T2iuBu8y7jN2/0z+HKK1JEf1k0
         pVGMVo7JwWzCuWFNWY01Mcqv+hjkZMhU03ZhpoVH1Ut2uDiZObA3y9FKp0L3QSTZpCcg
         xv25bxXHTqUiHZr3lD3vHZzG33JMR9Cs1641SzRBIAgExWxmUIDh9gl50Mkun9fHEuEQ
         m3tg==
X-Forwarded-Encrypted: i=1; AKwUvBwbCHUP6IJvcjgQ6JlowBw12WRaOvzr53pvCS7JOBGiTg8sWaKZxW5zTtbPK+S+9Gt8eRbyULfeD1U=@lists.linux.dev
X-Gm-Message-State: AFuF++kDIulJl0dfv29XGf1p177egtn9MyUXb4fDdiGjYgv+ct+zkv2w
	pxSEAihGbs1nnTINLOBoSda0kCUXAI1A1ZrlhEP+R7nOGpCB0c6nbmAhuxc8VU8datq4UA6mqig
	CZmvKRqHTjN5Z3VBB0SWqKAHTIR1YQ0ggTe5kEfEYRiq3KdlIdnNJ3owxYCIAvsfv+9hoP0fOiU
	YeHTyahuJITn4iPbKeANOiVh26UgQopWZPPrE6wJDAEccF9luf5u833e9Fe20Jk/kfVeDLqN3Jo
	0F0YnisP3e2fqA/TYIeXQ==
X-Gm-Gg: AYBFou33jg2aNZSVVUpSTyEXvs5EzwHDtaNt1EizQXnFy7Chn8fGECdKBbnKe4tE9st
	l/es4C9kQvMfgXQ8PS4RBszKXtOhLUtr+8TyAnzk6jVhayrvC6bHBve87BaKZU8QLNTZNjJ9vwX
	QgRcE4pqFFRxOnnUFh33d09rzL8071LM+WhB4YbRtKD1VV6cjBe1i+D2oudedS/pZBxMyYbw69K
	W9VhTKfKW46HyKmBikmgaQJ6ddzLeoKxCgLVSB3RuIIhrfOiZLzsulkEBzsa2VSIygOI7xPjZ0j
	EcvP+l5wnPPUu6SGhkiCNfzI6tFaRaY8V5j1kFLSoYBB2phW5qGZMMYGkv+L0QXTQU1A3cFji48
	l7AIL41hS88w/T7O1d+YCJ/m4I42THDYVU1VyqgtxTdjkSILmZNHKxxbptRdXJxL5wUolz4J2P+
	TwrWpOK2vASTU5L689Nf8uODshWLG9An/Apx+eCkugCg==
X-Received: by 2002:a05:620a:890b:b0:93c:5872:ef48 with SMTP id af79cd13be357-93e9b7da37cmr389186885a.50.1791377653074;
        Wed, 07 Oct 2026 05:54:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93ea2995c6esm32144185a.14.2026.10.07.05.54.12
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:54:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88a10162189so5740115b3a.2
        for <brcm80211@lists.linux.dev>; Wed, 07 Oct 2026 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791377652; x=1791982452; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRr2bOzV+ACM051eiPZmuzY0jHiw8RpNfmmijxyyZ5s=;
        b=EkQ95eLZ03h1+2k8wHuMpy4hoZrEf4bFV+7JF7ISUOfoAKE2Ha6HPD6M1N0aBdTVia
         mH4vskyEj0nhfdZ+sIzNmZ1qGaLmZOCMx8/S5Mqbe7rWOZVnGWk6TKa8dLPPULoYzNZC
         8EozG0UMxYUwTqlvG/aWQ2GPs0VjrGjDmKd6s=
X-Forwarded-Encrypted: i=1; AKwUvBw2G1Yk5MKV26KajpANWYAmOhhwJwtsSmm8HpQYanI63NTh9/i3s/rwevO63MilDVd6PEhM/ikgLr0=@lists.linux.dev
X-Received: by 2002:a05:6a21:3990:b0:3dd:85aa:452c with SMTP id adf61e73a8af0-3e134044716mr1756560637.30.1791377651859;
        Wed, 07 Oct 2026 05:54:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3dd:85aa:452c with SMTP id adf61e73a8af0-3e134044716mr1756535637.30.1791377651379;
        Wed, 07 Oct 2026 05:54:11 -0700 (PDT)
Received: from [10.176.2.78] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a92d5b51sm1411697a12.14.2026.10.07.05.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:54:10 -0700 (PDT)
Message-ID: <d28a1cfd-1bcc-4319-bbbf-7189a1ff8dc3@broadcom.com>
Date: Wed, 7 Oct 2026 14:54:04 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
To: michael.reeves077@gmail.com, Pieter-Paul Giesberts
 <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
 Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, asahi@lists.linux.dev,
 Hector Martin <marcan@marcan.st>, Daniel Berlin <dberlin@dberlin.org>,
 Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org,
 Hante Meuleman <meuleman@broadcom.com>, linux-hardening@vger.kernel.org
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 25/09/2026 15:43, Michael Reeves via B4 Relay wrote:
> The Broadcom BCM4388 chipset requires new PCIe initialization and
> firmware interfaces. Add support for these interfaces to brcmfmac to
> enable basic station operation.
> 
> This series adds:
> - Signed firmware loading and mailbox transport
> - Fixes for chip identification and firmware capability matching
> - Versioned scan and join requests, and extended PMK payloads
> - Updated event mask handling

Thanks for this series. It is taking me longer to review the full 
series, but wanted to let you know I am looking at it.

Regards,
Arend
