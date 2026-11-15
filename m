Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776816;
	b=GPDjbtNMgcOUt0/88AsaJCe3oc1MkuKs6YCre0Ql7mqR6Pza4pLmSsm9CVZX/n3jYs5e
	 nNjPUo4VQ4DwhO7uPgyGsLXvVby/EajAv+V0Ct77Bj555tFVeUkj1w9MuLOTUI8ySZDEX
	 dgBUVH/oTlKsGu2G7tJ1D/Z4NgddE9rwY/XfxspiQDZeMsoe863+KEHu98dceYx6hj1Hl
	 +VlTWknWSDzGFOkPcgvuiEHWdi0oQhEVdyia0mJGfwpHlpL7WjpnLSQ4bzbbcxier5fEL
	 hwbYre9P9Qr2vMf2286vGPv3Rm8fvtz+HIuotdpcY46sE4XrVnv7rnvUhfwngPwV+Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776816;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Hy5B50aWYdVKoabUEPf9kAEQZD5oIZknlEXK2QY/HkU=;
	b=dWPkE4kCb8r2T50HL8LXcF7N3XOUdZ5IJoMvJzg7QYVm9gOfaGICpOh+MPzg+c7ujc79
	 L+Hua10ElyYNUILCgMg3nYTTTik5qvq4ixbUtPqmWesP8B93maCoO/abRK1+hWK4YtlXs
	 4o0lEDwzVUGhMuejVCf60swx5Q7dzD5dpNq+bWW5Le7bagLHXw10pHny6zH1ofAfyEO0w
	 WDGDe1iJy6PGkjtqW9BCOB3NjQ3DA3+s5sdWNskwd2y0EprQsT9/uugqxKjQrFmcm2Mb+
	 18z2cBsof070zZdyyc+8DESro3BuU0VqaRVdiM6EvljggPV4wfMe/QkuyG0T5l3aCYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dP5+eFq+;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BCB606A329
	for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 21:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6BCB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dP5+eFq+
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1360549a91.0
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 13:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776815; x=1795381615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy5B50aWYdVKoabUEPf9kAEQZD5oIZknlEXK2QY/HkU=;
        b=PqH1UPh7D1SP4ZxPJWnTTD1+NBwRLd0BybDKKEe6/zFQ75z/0wUGGq3E6ySiA3QUw5
         MKOXsp+F2gdSSjba9qID2PzSjaA6Sc6I0xaftKRR+Rt57SKdpWc2CWYArD3yEKCVfF8c
         0MW8emYaV7mwR6blOZGzSCqub005CLNp4V4sDxdAu2tSRHqgHZLUakly4spmgvIFyxmQ
         TfJ4y3+YSySG3WagKmIEVfBL6tQ1aXheVmXgsbEuLd6G63l0G5UocthP9MPmYrGdDYuX
         bgxVLq+8T5R5OLHPeW5Nma3XBu4z6g6A8DwfG+qzFyDGSZIMrlB9rc7gp6LkL6OSzAw9
         6rsA==
X-Forwarded-Encrypted: i=1; AL+hErEQs0ZCFJBnmCP84lnQnRb2KIe6zUMO6wR/G6rQ56WaSyfuZGs9TsB1TJ8MKl2RiqeoWEYpB37Qxpo=@lists.linux.dev
X-Gm-Message-State: APuU4Z9/Kz+OxZW0QW4zj/VkoxqBj+/FmFNp7xgrvrfrT7hNqLWB6Vy/
	QMQMGfkxDScRVl8SlPuFYbEp9bjHF1gnxWXLo1O8xNqTL5a+Bko0r2YGMiMWHnEmevcYG9uf4Ry
	U8w3TfLeFM/WYfX8owWOIOj3lHEQMENyVdYQcI2IGam5CozMHkkDhznUirvxng9hQcTgTiHxuH0
	b7ANtnCNo/tn9fwU51wpQRKi77MXRlK9HH1ICpgjp4G2IVEspkWl996SNiQYmBMhvqqUDT0DqBe
	mukNSe+EXkcaaFbWs4=
X-Gm-Gg: AYBFou3yKSxUX/bMBlzHxRZLUSSqYrryKsq0xk8gekb21AhoT0nOGkJIKa0n+SkffMx
	aHrRD1vbnJtGV8BZJpdcLSMReXeO2hVWtctr0cPuIVshVdwmuGJrseNtdF+2YJ5fDMQnLhoZsTl
	IIpkisfoOxvo6bWmp/k4HL/Q+uVpCG/SZbL4hWRukouSZuaiF9Sax8oTdvafU+3Yg+032jf+AyR
	VCWpHVuMAZ66X7G6wHR6CWPyvL3hj5FIthqhNpjGy11+lvPvsyp0bswPGamDWASQfO1Er6ATZdg
	ozBov3eIReo5y0xwf8Ork1P5oyGtI9N9kbHpTW89NJ/8JcoJxK3bXOD9qbz+V0k6QG9nkctjiWV
	XFYqHveHhr8WOCdd1GiYcK5xJd9KYn7PZuG5zyGkC0VUuQzcIxGiqIKekoEWB44+V8BIeV6yacb
	pMj6X/rJPUYlVPAIwF8u6PuyficgvlepvuWxvIdzU=
X-Received: by 2002:a17:90b:4f85:b0:3b0:91ce:6720 with SMTP id 98e67ed59e1d1-3b1b0a1ef3emr7944999a91.30.1794776815117;
        Sun, 15 Nov 2026 13:06:55 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3a17086sm5243118a91.3.2026.11.15.13.06.54
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:06:55 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so3646456eec.1
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 13:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776813; x=1795381613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy5B50aWYdVKoabUEPf9kAEQZD5oIZknlEXK2QY/HkU=;
        b=dP5+eFq+RfoDHki/MMV4cAuUR4cL7dTblcF2mBcTkUcSTEsZ4JnPROiunHU4QrbrqX
         t8DQLkOZKqA7ftIkrHCB3mgivZ9HkEotXGqOJs4b7eayYJionaMannCysP3S2hWe2cch
         zTDf+Ru4UfSMWFWwmcX8FIcThyWL/4WGKCc9U=
X-Forwarded-Encrypted: i=1; AL+hErEsQpUEK5+9ZSOeehdHScqryMgEzzzMNAPwpCumjbt81HjX8UzGTZQS/jZ+q4a+xdTCBzxzCvc/cIQ=@lists.linux.dev
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr8998725eec.10.1794776813214;
        Sun, 15 Nov 2026 13:06:53 -0800 (PST)
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr8998706eec.10.1794776812568;
        Sun, 15 Nov 2026 13:06:52 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm28693790eec.9.2026.11.15.13.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:06:51 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Angus Ainslie <angus@akkea.ca>,
	Kalle Valo <kvalo@kernel.org>,
	kernel@puri.sm,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: use ISO3166 country code fallback on 43752
Date: Sun, 15 Nov 2026 22:06:46 +0100
Message-ID: <20261115210646.889090-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018-brcmfmac-country-code-v1-1-54d7cbcce035@puri.sm>
References: <20261018-brcmfmac-country-code-v1-1-54d7cbcce035@puri.sm>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sun, 18 Oct 2026 08:52:43 +0200, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm> wrote:
> Without this, the interface stays confined to the country set by
> ccode iovar default value, which is usually 0 (global).
>
> Tested by verifying that enabling the fallback makes channel 13 APs
> visible in scans while in Poland without having to manually change
> the ccode variable.
>
> Fixes: d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and initialization")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 1 +
>  1 file changed, 1 insertion(+)

The subject does not indicate that this should go in the wireless tree
so wireless-next is assumed. The Fixes: and stable Cc: suggest this should
go in wireless tree and it does not apply to wireless-next tree. Please
clarify and send a v2 with [PATCH wireless] in the subject.

Regards,
Arend
