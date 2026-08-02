Received: from mail-oa1-f99.google.com (mail-oa1-f99.google.com [209.85.160.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5422A390613
	for <brcm80211@lists.linux.dev>; Sun,  2 Aug 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785659963; cv=none; b=X/JZGRi5GDu6cE1A2UQBzFzRrsx1se0M+cnp/up7YOAL9qiuHcL4DheMsubDP/A+69wo4DhCpzlnCUWMkEdpYwNf8+wQbODhg0H5ynMzM2ANwTFrlSuIi/iiOb7Txlcos8j57NXeWV96AGIG1N/HfvlL/4x0xcW1tU7W+V4Rf0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785659963; c=relaxed/simple;
	bh=paEteDYu+VpkpJUu3TA3jGp19kJt8vUY/SRmIaxxzXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqjHlIqAnn63Igk2qBAa0zsZ4EpzP40mZdiL8W3UpLe3Ljygm7qL0JNnvc7JaPypttm/RyNMD6qu0+gAUl2NXiBtIAU7EOgIKloMBUBxASA9bP11cM0CtEO+SShHCFxrKO83E4zd7oKvnA97ZBhe0NZLPiOFwq/KVlOHNrgGbsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=efUNQMLj; arc=none smtp.client-ip=209.85.160.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="efUNQMLj"
Received: by mail-oa1-f99.google.com with SMTP id 586e51a60fabf-448b89f700fso2367427fac.2
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785659960; x=1786264760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0BprMNy/y+4QZvQsdZngDdHnMLVEPPrcOP8U8U2Ffw=;
        b=O4DEUG7U/PgnYrqq/vfYarEGTYywDL1xis3rLo28GELZ8Kr2hopLM1+IU47qg8u4TF
         Pacb3rjzj9omUeFeEb5CTx9KHTXXseqbxstS1S7V/6g2VV8/98K4WZ3nrMsUCYr89Btn
         NP/QgrHdRrml8ovOoXEWtdu/QTU4aun24JIGPfup3pB9F7lUzb6J1hl1xWXgZh6u/tcp
         +bu934PKhXUNfF6eN5MiA1AIqDFYeO74L3HVY+UJSmT/iWy9JQrfbPqJIlLJ1UDBopHG
         uXQ3g76qxDtedhWZTyzHX8zBBCn4WwrF2mzW2me2qIyRGFV3pAz+PT0cTK7q5NvPLEjy
         22hA==
X-Forwarded-Encrypted: i=1; AHgh+RpJjWbXm5TtPZUjcHFtfkI0r/0oFJT+ptxBp9OX6CgV0jMFRmoxwHPOAStiaD9k2KZzuj7pYTxuGyU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgbBz79EXZHoMbFtElrNdwW9KsYsgxKiXHKswLFHPaz8yaineA
	tHILtPVTZ6LVcRsUmlWMCfyFAff0quPKxImJI7fxWqL4HptxcpssGn69aXfU6QiAn4R6BClwfwb
	fyzono4aEPe1SZf8nFSpHktW4uK5jYvfyTT60nGBy/JzAg+qBEFmG9YADTTkUiKIcfFuWOrVeNP
	yo07NVbkAkULAe5kLdbAg6vWWe80mRWOL9tFWeYJ6EqCYyuaq/PsTUz+QxGJMlKnxO4WCj9CpuB
	eHVXwkPjymcp9QnbE11NQ==
X-Gm-Gg: AR+sD11+8bIYTQLtyDVpB4IcnSBtaKUZTl9WKRbZcyIpQCc0s2pACrOdVrXK6EkSDsM
	cyT31BuB7FioZTWB5qLG/r32DPjnTPn/y3uCn4kFJGkBcQwAKPa9ly5pvdh13I3LLzxkmpJVEPp
	p7k2EG7Zc/hUBQCcg3iq67otrIH7QtRZ3zb0MSonIR9HxjJHL/61l5xtUGsLcRpqSotj3zXbGDo
	gxdzsZn9CjFJ9CN1J7aI632kJIFWsqg3pPQQRKSq8SJtR/p/j6d0S151KIC02r4FjqGnZvQcWl+
	4rhe93hdhHt8yhO3Gt60EST+xkoTSmFMKo1aMtGhOtIl3ZhgE7iH09CxEb3SlN2n+g5AGDrswg8
	ScqBChlERb1i0lLjf7N09/k3XB0GFyfza3J5pPFxSgxCZK8+y8bEsHjLz4fgkw065vzoLMGsy+7
	+sHK2FZ42LlzvO9m1OgzPMWu3P2xvv7ShkgmPT7Wk=
X-Received: by 2002:a05:6820:168f:b0:6aa:e573:9ce0 with SMTP id 006d021491bc7-6ae4341a0a5mr9805327eaf.16.1785659959987;
        Sun, 02 Aug 2026 01:39:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6ae39f707aasm468724eaf.13.2026.08.02.01.39.19
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2026 01:39:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so252004785a.2
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785659959; x=1786264759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0BprMNy/y+4QZvQsdZngDdHnMLVEPPrcOP8U8U2Ffw=;
        b=efUNQMLjfk/y9Xn+NCBr4ztxSNvvx6Rj+atUq1/KEbG3C/BfC/PuFckRzHFNd4xeFt
         5qiWs8GsHxdvdFOc5kbbxqyWKATzgxOdara+b8D6l0KNCnHAFxIvPvVrK4Mz8uOzgU1V
         qpCfCvKl1JE1bhxFbMkTfQBxUf9sXdhL54yQo=
X-Forwarded-Encrypted: i=1; AHgh+RqBxml7i1vzuig0UhACenYDQKVBRr+uh/WUsXz/AfGvf93hPQfKt7CAUiuLuR7rI5gBGivuUJv+Cfo=@lists.linux.dev
X-Received: by 2002:a05:620a:a405:10b0:930:e48f:47c1 with SMTP id af79cd13be357-934a0a8b208mr890886885a.35.1785659958792;
        Sun, 02 Aug 2026 01:39:18 -0700 (PDT)
X-Received: by 2002:a05:620a:a405:10b0:930:e48f:47c1 with SMTP id af79cd13be357-934a0a8b208mr890885385a.35.1785659958263;
        Sun, 02 Aug 2026 01:39:18 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435def8fsm49457956d6.38.2026.08.02.01.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:39:17 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v2] wifi: brcmfmac: cyw: pass PMKID to firmware if present
Date: Sun,  2 Aug 2026 10:39:02 +0200
Message-ID: <20260802083905.3819981-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260725013528.169218-1-bogdan.nicolae@gmail.com>
References: <20260725013528.169218-1-bogdan.nicolae@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 24 Jul 2026 20:35:28 -0500, Bogdan Nicolae <bogdan.nicolae@gmail.com> wrote:
> Zero out auth_status on initialization. Otherwise, garbage will
> leak from the stack to the firmware (when ssid is less than 32 bytes
> and/or when params->pmkid is set). Then, pass the params->pmkid to the
> firmware (without it, the firmware caches a garbage PMKID on successful
> authentication and denies a subsequent association request that includes
> the PMKID).
>
> Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
> ---
> v2: Split into a separate patch
>
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Please add a Fixes tag and Cc stable:

  Cc: stable@vger.kernel.org
  Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE authentication in station mode")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
