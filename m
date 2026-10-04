Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD41F3EC835
	for <brcm80211@lists.linux.dev>; Sun,  4 Oct 2026 09:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107153; cv=none; b=TdOYm/xO3KBQICnGklNGbnNpMrNmmNR6kry7KnbUqGIucBFiPKVV5Miyy55mkCW33gs/YP6QHqeqeE0utCuuZFhxcN+4G/tqMj5adfdsFM6Gn+vIczLWFxFJplAvfXjsmD/SIEuMuMSf3pbsoauhGBAA3zyagEzCN2Xgefc88mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107153; c=relaxed/simple;
	bh=420Bm5WTSD49smEVgl+DOIJhIdSyTQHkYriLCLQg948=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plX6h0qoLQt4T+Z5S8QGYosFPbfmKlKqW6cZa5Te0zdLGXmRJskSiw5mI6yKjjfnLt4RZdJO+itS1QU+E/eoQtLgxmUhNXzs1z6MG4AHg1N4WSMJ2jzB9G/cymPWtatv7or1Gl+ruVIKFcT318weVappWk28/V0eQxx7fFRv7ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ASZlQRVo; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ASZlQRVo"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2e2d4cf3668so967375ad.0
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 02:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107146; x=1791711946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4huEKa5MU1WXjI5tT87BDY0G4FHdScFokO8zXM7rU8=;
        b=dJw4rGL2H57bTmDlbfevIlunGJf4G3PfKIhx5PtzmjSsuUrttWbZAO9O0+db+z4n9r
         CCwVjkkFOuxWKGaymQWqyeJdWtPCbdv0zlSIRPzKoDmfbDjuvLnwYOSTbmfCHNDap3qq
         jcN0Yy3IvAbjvUCZy146oXvuHGc+WGqGaQOogJmAw4GoPFfMPxGP+DHJ+7KUykV+YTVk
         pS2HVqtJXksDkdtwLm6nBfte1kyWhoSlKnPUfqj4L4O46NoiPlNPcXbAUS21i5P0DXJn
         zwUUDb4dirYprz90Ckt/y9/LjqBEfSZZzmn8/VZA50CLtJFxKmxk0rca5gYUL2R5Guiy
         QK5A==
X-Forwarded-Encrypted: i=1; AKwUvBx3SBxsi75jIv4/tLPXel1oAJariPhcA9GFzHH5AfH9x/wj1WXcvUnzgzA9mJZE3IyqONn01PrMJRk=@lists.linux.dev
X-Gm-Message-State: AFq9FYI9RV1fJjduWl38vTDSmRAgL3oXkL/Fv2R3aCug7JlwQeWo3KZw
	vcRi7dxHyAJT/BN8KX7afPnN1oiEyZjy4UN2nyu5LQZ1iMJq0si5Pij7gSQQTvI9Zu6MRjWILJW
	PezyokuED0Mwc4NLtBsvX2lG0Dj83C5M6LiL0yA79oUwEJGiSG6OsMehGMxu7qAlPfgh1HsfN0j
	0dn4UVYBRJjsYaBkQ2OwfNTDAtFGsyo5SI1rEwhQJEIGb1T4w6LVjMxocDo790uhpF8cbz7PccF
	6xkt3tba5yKDECXlI5LPw==
X-Gm-Gg: AYBFou30EQVPz5B/aIXz6pMWUIivDuedd25NZyk0tz1UMmfWz0M1BViihWx3JCgvcn2
	UFDU6X0ZwBf71AH4d40/GhRX+NVHu01LhC35Hi657cr2Bhfp1iB7cvFajxM7jrX8rU5vEQ17hQ9
	CKaoJfwILYzj5MDclZtOvhkq2jqerAGSWp9LM5emDaa4gxbUJ8pJLv8wvPgNiUl0TGBzKGUGEJ8
	21pJ+Id7hRgsC3siCWZKTgivFRkL4buK0aDWtz7V7zg0vzIwXnKeMvWdqTWsG/7gwu8nBDjOhzx
	ZTko9ynwvs5Afub/gdQXbVqrGPEXvl/K2Vp7MeOkcr15m4pTLKJa6sWJtrdtCMJizAOCjb4hmhF
	uAgeMPs8G5nwlw3xDIew48wP8p7RaxzWIpcyWExNaf4I3tovm8jMXlcp3haog6hJ1WMXyyG3amI
	n5UXSPyZX71YmeRTzv24dwRvsFH/DSCXoZicW2dis=
X-Received: by 2002:a17:90a:38c3:b0:3a6:f893:8bf1 with SMTP id 98e67ed59e1d1-3a6f893934emr1834100a91.55.1791107146249;
        Sun, 04 Oct 2026 02:45:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a78e49134asm2498229a91.6.2026.10.04.02.45.44
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 02:45:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso927428eec.0
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 02:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791107143; x=1791711943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4huEKa5MU1WXjI5tT87BDY0G4FHdScFokO8zXM7rU8=;
        b=ASZlQRVorBn8EH6DQbNAqeM0aDdCk+JpZnNT63ydF8z59MZWJ6djmZoV1ZMANh1x8q
         hYwPbJjN6aYaCd/hVJ1t0WF7JNDkHgLZNzimk08VEc2LGiBL4Jt0IsUxOIoo1zLLLRSr
         suPzqgL7paWv2YbmH8MiIfkTTfwDTdfgn+yww=
X-Forwarded-Encrypted: i=1; AKwUvBw89pJbiZu8OvNsPMQkYe6Ril0o692TdnJWZUQFP6RoGv7bnCfGM7RFyW3QzJ1rAjqz0tBkkWg4S7A=@lists.linux.dev
X-Received: by 2002:a05:693c:4089:b0:351:d26:b74e with SMTP id 5a478bee46e88-3510d26ccdbmr7154439eec.1.1791107142839;
        Sun, 04 Oct 2026 02:45:42 -0700 (PDT)
X-Received: by 2002:a05:693c:4089:b0:351:d26:b74e with SMTP id 5a478bee46e88-3510d26ccdbmr7154413eec.1.1791107142210;
        Sun, 04 Oct 2026 02:45:42 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272ceb02sm6392294eec.25.2026.10.04.02.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:45:41 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Girish Rudrappa <girishbukkasagara.rudrappa@infineon.com>
Cc: Johannes Berg <johannes.berg@intel.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	wlan-kernel-dev-list@infineon.com,
	Bogdan Nicolae <bogdan.nicolae@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH RESEND wireless-next v2] wifi: brcmfmac: Set extsae_pwe parameter to Infineon firmware in SAP mode
Date: Sun,  4 Oct 2026 02:45:37 -0700
Message-ID: <20261004094537.1324150-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922062458.3550-1-girishbukkasagara.rudrappa@infineon.com>
References: <20260922062458.3550-1-girishbukkasagara.rudrappa@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 22 Sep 2026 06:24:58 +0000, Girish Rudrappa wrote:
> Parse and configure the extsae_pwe according to the information from the
> supported rate/extended support rate and RSNX IE
> 
> Parse the beacon IEs on start_ap() and set the extsae_pwe iovar.
> Set sae_pwe to 2 when the RSNX IE advertises H2E, 1 when an H2E-only
> membership selector is present, 0 otherwise.
> 
> The changes are tested with FW Version 7.45.286
Just a nit about mentioning firmware versions. I doubt if it is very
useful. Anyway, here is my ...

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Girish Rudrappa <girishbukkasagara.rudrappa@infineon.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 77 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/cyw/core.c    |  6 ++
>  .../broadcom/brcm80211/brcmfmac/fwvid.h       | 11 +++
>  3 files changed, 94 insertions(+)
