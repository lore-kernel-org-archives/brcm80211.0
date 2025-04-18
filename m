Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3808213E77
	for <brcm80211@lists.linux.dev>; Fri, 18 Apr 2025 17:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996819; cv=none; b=ptJUZuIloaX/j0GGiXiqXAyEPjmGuLmAOeD8d/HhECMTe+3s7bN3yT0b0oLGWjg67myYfZVonL/s2YR/FDyBCvwN40i3i3YVtz4cz7E85kY9/ToGkbpaoAoQo7DuukpdU1ZkN5i1ARFTzsI6koA+ZEAUqPNZWJeCNV5zpKdeRcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996819; c=relaxed/simple;
	bh=gdt/NV9Glf7Fy9xwm9CRlRigMSp/rqvVs7EFkYy2f7c=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=dnmNiAzD1p5GdYNKCPpbB7ANiNYTjnnoePjgO9j0kK9WSkY/AP+P23NSxAVuNqYIa575SyhPd345gAPHxwmM7qB5rBynX6dY6Wj6bdtXl7i54pTyn+s+yGy5ncZXV1CLpWQKMpE9no+CyMhi59CIsVFJaadwbBhXS6/o8CAaNRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=En7FpmvO; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="En7FpmvO"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac41514a734so311298166b.2
        for <brcm80211@lists.linux.dev>; Fri, 18 Apr 2025 10:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744996816; x=1745601616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aae0yNU6qEtMnT9iszupHMKlGwdOca1yf9jTD5h0zYo=;
        b=En7FpmvOinihdd5Z8jBj67AU97wMHoHzscmMiFz/VsbJSXF0n6FL0B5CFzgxg/mmfj
         w20+mhMR60NV9Ca4VSvmtJWv3+dpCyasktJyIopvn8ae0Wv8R4WtQELTxmaI8iM+CmkV
         6djdzwXbhuZwknsYWaS4IN0RNZEivRTrN2rvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744996816; x=1745601616;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aae0yNU6qEtMnT9iszupHMKlGwdOca1yf9jTD5h0zYo=;
        b=Z82Zl9dGuUcmGeKFBkjmpSN3RJdpqVkepzW1BHXbZ4oRVQjg3vTVDX/Y6W/kjellKY
         4z2AXKzUassYcU7zdSLj3YP3vWRzntD42mQtmdJgVXaqJiaKg1JSM9zzYw6veBmjkOeQ
         S0bk5raQTkcWLJOhbD16c/mQdbZB5KvxviXFmcUtFflIPeQPAQaWarNcVod7k//XyMRP
         5TV0+kpmzcPfMkUimkdfnPVbq5buC7/OqP46qffa43oCDsmpPtvTiWBIv74CP4J4FEpJ
         F9vP3LhjH09g/1QgFruCio/rtPr6P8FAj0b/T/NCjXg9TjWk81aFeGGn1U8FRXGmVIYQ
         FoVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU14P07HlbivuDCDBaQ0ptg5VcWiMyjxeOgl2U420NFG2KnfARBtKcJrZLg9PSpXvh3mYb6XrM3ewM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTaGhjvT4JyI1l3PUawFtfLY0aGXoXEHaX5gjKe8ku+Zm92+f9
	rc1528nSSfTyUd8lKKlZXAXr4hhmXVlhQHK8htgBz6UJWNxPDAtjHlQIIfk2MWBMcstiJUrve8z
	6RQ==
X-Gm-Gg: ASbGncv765Wfsvm8ncuLo8FSCRjLYcDuNGR0TGpSpctFeNOc2SdObsmL/Pi78y6GXJw
	wRpA/pBScn3ufS67f2NMXyYI/46X6pPsVMxaiY3AaCRm33Es7glnaXzARP+SkcsF5HODtkCea4f
	61cqer7mcVaK7XCMuO6FsSYeIs6qN+KogH1P+gOiMs5Q2gPV+Hp3EQeMO7z72PJRn/1FolereGC
	exr9+fTgcxNrT9aOcJlIcaI0MbqVZZ5QwnktCEk2icTigzvTtqLId+Qnrb9T21TAdaUvIYOi9Jb
	SEN9tphvieunPIfeO3DJgPa5oKhTPP/ZDri/y1aXexVraJM8r3Idm7R2iAxmfVWO9nmP3K/wXPO
	P4c8=
X-Google-Smtp-Source: AGHT+IGmpeW9BuVDPsEIwdhBrrIRV6HcZFEw9qtB3nQkxc4APEStoRLK1oRuRA+PdwXu+7SAr+cdgw==
X-Received: by 2002:a17:907:f80f:b0:acb:88ac:e30f with SMTP id a640c23a62f3a-acb88ace3b6mr42279466b.20.1744996815959;
        Fri, 18 Apr 2025 10:20:15 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0bfd9sm143393466b.29.2025.04.18.10.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 10:20:15 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Simon Horman <horms@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>
Date: Fri, 18 Apr 2025 19:20:14 +0200
Message-ID: <19649ea4cb0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250415-brcmsmac-spell-v1-1-3e1375586883@kernel.org>
References: <20250415-brcmsmac-spell-v1-1-3e1375586883@kernel.org>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH] wifi: brcmsmac: Spelling corrections
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 15, 2025 6:06:41 PM Simon Horman <horms@kernel.org> wrote:

> Various spelling corrections as flagged by codespell.

Have to admit I merely scanned through this patch. So for what it's worth 
it look okay to me so...

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/aiutils.c     | 6 +++---
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/aiutils.h     | 2 +-
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c       | 4 ++--
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c     | 4 ++--
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c         | 2 +-
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c | 4 ++--
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c        | 4 ++--
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h        | 2 +-
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/pmu.c         | 2 +-
> 9 files changed, 15 insertions(+), 15 deletions(-)


