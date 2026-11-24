Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551250;
	b=cJGdRNd+NuDtHPrnycaJyTot2tyVIUqLK93wLVlquaRMjqnw9k6a0PiXt3HSrOYDCsyU
	 cJzHVFAhzrIZayv4ZOlBabt85SofKaxiI5WDSeLtUeSM4UBiPlbGrBHevz+LILvSdOxRP
	 MPrO3ITeWmzoIhO4VnNQ4BSg4s2L8Mod9GPh8X3uGck0S9bx+3pCOuvzkn939L2DTICwc
	 Chofu17cR1l72/fSXYzNupF39/QlYbYDBZ+qqMuTuskFow6CD9uBPgZB8o/cB2jsMmyXa
	 oSIyejWiAqwYPvKsKZlJj8+B3ZAg68oS2b+nQlJ5y8oQQ0VOnZAG0aMqtfkw3iRaGYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551250;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=UPLVVDAmC8PDn8fCPCfleQnG71yk1pEKS9gObPmVymc=;
	b=nR0w9q8iYnuqPwWuRrymAMSBFH/VejEZD+tkf59SppBJDKLQQrcuaOFG5N7JdLzKzOVa
	 Hu89dli7gUS1lvhL13yi6R9V5iBl+I4U7cbzTR/EGDkShZHkLECphmfjlz/9M0X7MxLHq
	 Lsfof//HAI0WT3Hr9iK1iSLuGnTW2oK1QHU9OwqCiEDvZZr8cAVdgtCW/gRpxHPnXuBuO
	 q82DRUUG12Urew+jqUH+9rVaBzgp0gR2FL3bxstMoVpQ72WM0Gc1Lu3pR8aIovWXzuQfw
	 pcKJM7QmY87RxL9uBctBwaY3qpTUjf/NhvSk95xeIM1swnEiiOP2H7i9XAxUgNBznIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hJihpA3V;
	arc=none smtp.remote-ip=209.85.217.97
Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ADF60A2606
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23ADF60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hJihpA3V
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-7d2dc1ac787so1587929137.2
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551249; x=1796156049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPLVVDAmC8PDn8fCPCfleQnG71yk1pEKS9gObPmVymc=;
        b=v6uBjUj/xJgvAzTlSSYpx9AIbhlr0XzGTWDQEk5agOZBBvP/lxxe4p8DyPoic2VJQR
         j2xxoRNRwcFcgn7I3zwlAnVHRvZD2uGcf3Tka/S1cv/msFnS8nIhEVeW0z1vpjBpEePP
         c46c8YmRkQXbIfLnzR8ZYAhSQ0C5qVZ89Djp40GqXoEaPZprUkMRPvCmRvE4lhbCv/bo
         yUmlZpJN9fnY7FYWNm6XzLPll/x5U9Bx+Tz9/hKWrWBXuXNcBuQcTiGIhh5btGfjxhtK
         JvFZM15S9MLkgr94zq/602mvTbELniVBSUezVq5k7IoP93oMKuGOVmMOMNxWkIOpTBRw
         I/Vw==
X-Forwarded-Encrypted: i=1; AL+hErF9F+gVll/VnP5xFtGmS57yN5XRizslsSc8RqoeSX39DICnTodC+HkctXUI0Ezn2Y6fBHHObpitz1E=@lists.linux.dev
X-Gm-Message-State: APuU4Z8EK90+I0VnqzRDXa/2EjGrMcS/zPVVuH9mGuLELDmYInU+2YQ4
	FLcFPnd3kXP76PA8E27iMot6e0N2uquZZ/uM9Z9Kjk2NczYGaiqwFrgFrbh4no3gESvzr9P7bpC
	YPKpmU8A72o0LZw1kSMBblplpA3GAorqJEXD476Sk7gadxk+CfG6xz2g0GC4WZBOaUXmz7HlJN8
	hGtQmMUh+ro0eTIWw2dTROIOytCCD2kPfRL+iyCoVsqKINUWFH93lVPUwJwvm4FcMkRoZt8Trg6
	y9Xtk9j5Z0DP/alEBBMWg==
X-Gm-Gg: AZFdTZdSJWDvhZ+uDSo+OhY7seum0yLUxEAMb+5Jglg15Gpo+6jqC6bY3AQX15oMeKw
	1XrK1pRHaDM4QS+VFIP7IowOcHIG99gjIwl1ADUnwuaR8ItCPRekHfUUpsfwwBMcuQhryffKIXp
	myBd3kdn44RXGqv5UgacMAU1NDGfVIzYxp40Kha3Ywaaz3NgYCFP6/VmfRkHlYmE99VvMyuo3i5
	8j7yPZq0CjtJ42qws3Viskb8vpJ490d6vDcuzZC0M2m3J0j+pdgZ5+rSYG5F15LTZzYkw6nTsG5
	FBjh7RbiluLkguXtcrtTZaBTiwVMcNUI6zipxl1/YyU3nlytoHKaPArr2RlmQQTZfq3GE5A9tnw
	xLXz8M/30zcAaaCboi77ed++UGCcEYL0rwGzOTPRmHWMuUFw/TVaZa4rQ/ehngPkZ49VNjpqAC+
	kgvqBiHUTG6qpWKA2k+fdUAFmFAnjf6WKfJKTrkrs=
X-Received: by 2002:a05:6102:fa0:b0:7cc:23e7:e74a with SMTP id ada2fe7eead31-7d7393b6634mr8162023137.14.1795551248895;
        Tue, 24 Nov 2026 12:14:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7d6e7fa226fsm135008137.11.2026.11.24.12.14.08
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53661e036a2so93514771cf.1
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551248; x=1796156048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPLVVDAmC8PDn8fCPCfleQnG71yk1pEKS9gObPmVymc=;
        b=hJihpA3VlTpARJ4ytWjClJV+e4oy02KmY1A3rBmrUKxSlCbdi1ctjE6mMmHKb4tDtl
         8YueSLPuhY2Fm+lBejSkgsHUkSC9SFDJUuwq+EZDqwpq8yztw08OLb4O9UrpJBygEHjk
         Qun3oi8Y09YvMw3L2aAuW3TVLQjtbguZoxyUo=
X-Forwarded-Encrypted: i=1; AL+hErHYx53R9WmUjO8fDIVRqTssky5Iu4MsfHxDkNwWHPU3VqVBBBEqFt3gWxyTlfZRXpy8Kl2InB2c7jQ=@lists.linux.dev
X-Received: by 2002:a05:622a:4d43:b0:55c:96a1:b6b2 with SMTP id d75a77b69052e-55d76a6f482mr260166581cf.13.1795551248016;
        Tue, 24 Nov 2026 12:14:08 -0800 (PST)
X-Received: by 2002:a05:622a:4d43:b0:55c:96a1:b6b2 with SMTP id d75a77b69052e-55d76a6f482mr260165941cf.13.1795551247420;
        Tue, 24 Nov 2026 12:14:07 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:06 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 2/7] wifi: brcmsmac: embed modulecb array instead of separate allocation
Date: Tue, 24 Nov 2026 21:13:57 +0100
Message-ID: <20261124201402.3499613-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-3-rosenp@gmail.com>
References: <20261111042554.232998-3-rosenp@gmail.com>
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

On Tue, 10 Nov 2026 20:25:49 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> Replace the separately allocated module callback array with a
> directly embedded fixed-size array in struct brcms_c_info,
> removing one kzalloc()/kfree() pair and its OOM error path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 --------
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
>  2 files changed, 1 insertion(+), 9 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
