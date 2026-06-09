Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BABD34D3B5
	for <brcm80211@lists.linux.dev>; Tue,  9 Jun 2026 14:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016523; cv=none; b=QmKfZUWhm/9Isc9DPuVZVhSWD6figVwBBZF6ODrBtYfr3aPRkSjo69O2xjXDrXKDRkWookNukiw3UvJOpCXCrsHB/HStSAvnGaLU/ExRHdA74ukaxys9v7o9c+fLeQV5uB3SlDJJphYLWzhpXxSXRw3owI9zSdFJGTqgTQC5l2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016523; c=relaxed/simple;
	bh=91M7+RHOfJutGnS6ezebTu/LMAPUCMXCn4h7r5lGAtg=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=r/P7zAVXvnC7Yq9tFvfqsI8AItA4Qh5I5Oe9PcyrAGYzq7eApR+lQRyipv5Dy9jVVcEsKkl/P0qLWYOJIrBxsm97bLedUGM0BGjtLcxtBbQBOw7GGiHvV4zl0GT3JjXo9H7uwmGPQAFg/AN2B/11ELe3a9+LdwTjVlaKOCkX78k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NqCYWoSu; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NqCYWoSu"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2bf18c30bb2so40219035ad.0
        for <brcm80211@lists.linux.dev>; Tue, 09 Jun 2026 07:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016521; x=1781621321;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdgCBltfiFlh10Nms4T7wj3+rz/0jCZ0BoMlOBU5Q10=;
        b=YTe5JwYb4MbLR8T7i5CpfkK02yMTmbXUq75vqdLUn0WS3o09AIbxJmLL6O9QoYBvn7
         07YhvRkAwOGD8w/lch2yVF5gnZJUxZZHe0iMGiHQe4iDi5M3p9e39yLa8F9XkXahXddD
         7Wq0hz7lJWfM6+8s1AmjVS6SlcaIHxI+kv8K62/LPIi71joLid4sUOT/M/ml0+uyOSbi
         DeSLWph2Xc6nF0d8smBvpZx/2Mx1CqXp35oSaJ3mMBhUXT1KlNQwek9/G3y9JwImsFba
         GDdBoXRxJQQbFwnRe18iOkHDKySrDjNA2wxuCf0HHLYZ5ydgBqczSo/KrI05wvrdGFk2
         tSVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vR1vOzA2On0zXnEVyRKNFzUHzteOAMObwLPUZl/IESMfj9ZKtnElOb2oVmpsRBNLpsQ0xWLLKgBQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTajtYpb7fYBlN3AdWaTaBq39sPSPTZB2IqEaNVr73RI/6kFxX
	VaQdgt04KNXQT3WoGguXk8uBVsF/NSF1Qvu4NgvX2eAeJLN9xGbqCstQr7yR5HqMNP22ErUPNkd
	+rGnzxWOLlP/7sk4RWFjaErdyL0u7CL7yJZ2wlp/WTvF/fi7hyksuUec71viSBct9VdTSsIq9GU
	w2V0/sQOKIsFgcq2+4/QqTBu+HZR45SJFNNf8ZCTy5+op1F6dW5Duyf7fPqLfUeugVQni6cPfF2
	5DuSpuZVXWvPFVytUVc9Q==
X-Gm-Gg: Acq92OGFdZ5beXMaF9V9P9g/qREmy15UrOhvcemoAAGiz4M75YXoKNCwpABFFhHi2mO
	I83R2LKzXzy3UdyQIXB1+gTnDS2POii0sTne8dOeJsAZHdXu1rPywJ2YV+pOMMsWWSiUAcP4fIX
	G+g/v3Hf+u1JwCM4ef/pLJqPhH7pWWdi09dXp5yqLS6jp8cs1mEPqsrGp67ot6gytXMa9P88mE5
	XkfGT+A0eD/ZWb16VMhrOg7yENBYLBF0Y7zgvU58mKsr/l5uTe+3uQGWOSsRo7SbkpD1QEZftTU
	55fc+mbDfdXS90BUhUSSkpze9VmUrI8n8y+HiyHADW0ZLBy6KGCJIDiGDdIUkPpOwgnjigqFHTN
	8VpMFUgHNTCeDTjAvxnOkJ1nM52CZlCuNq8A/fuO8HaCFvYLZfYNC5vbOJx9aWx2DFh7iC+FDK8
	CZ0+VyRKuQqJAnW9ZR+j5d9hzJsQgAhmiBmLJzAdOA9+nd+MxXweb3nHdmldfyslWeUHVZxVg=
X-Received: by 2002:a17:903:18c:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c1e881fefemr245084715ad.20.1781016520346;
        Tue, 09 Jun 2026 07:48:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-21.dlp.protect.broadcom.com. [144.49.247.21])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2c164f71ad7sm20536105ad.8.2026.06.09.07.48.39
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:48:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-68bc68bc910so6439414a12.0
        for <brcm80211@lists.linux.dev>; Tue, 09 Jun 2026 07:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1781016518; x=1781621318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdgCBltfiFlh10Nms4T7wj3+rz/0jCZ0BoMlOBU5Q10=;
        b=NqCYWoSuGN5Sxba+ckz4iVP1EJGBWPO8BQXnJcYgWWbx9arFfxq5+meMtFDJj1soJw
         Kl+BGx+KbEFZ4yegrYzm+mZx3fn1/4Oc/bmpPSt+rFgyjQsimVmLRqOealz0zmoPwz8q
         YE3VW93c93Kwws4U0B3z1xcTnTKMXMz26JrBc=
X-Forwarded-Encrypted: i=1; AFNElJ+FKZy0yCWBKpJOvcgajCkF44GyKTor/UVcn0dIG95oM7gk0PtqSEUD3w85hItwpW/5LT1mqgc+wKI=@lists.linux.dev
X-Received: by 2002:aa7:c041:0:b0:691:957a:bd61 with SMTP id 4fb4d7f45d1cf-691957abe39mr3347464a12.7.1781016518300;
        Tue, 09 Jun 2026 07:48:38 -0700 (PDT)
X-Received: by 2002:aa7:c041:0:b0:691:957a:bd61 with SMTP id 4fb4d7f45d1cf-691957abe39mr3347450a12.7.1781016517755;
        Tue, 09 Jun 2026 07:48:37 -0700 (PDT)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65027662sm8944678a12.11.2026.06.09.07.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:48:37 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>, <linux-wireless@vger.kernel.org>
CC: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
Date: Tue, 09 Jun 2026 16:48:36 +0200
Message-ID: <19eacdb55a0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20260608051102.6698-1-rosenp@gmail.com>
References: <20260608051102.6698-1-rosenp@gmail.com>
User-Agent: AquaMail/1.59.0 (build: 105900627)
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: flowring: simplify flow allocation
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 8 juni 2026 07:11:22 schreef Rosen Penev <rosenp@gmail.com>:

> Use a flexible array member and kzalloc_flex to combine allocations.
> Simplifies code slightly.
>
> Add __counted_by for extra runtime analysis.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
> .../wireless/broadcom/brcm80211/brcmfmac/flowring.c    | 10 ++--------
> .../wireless/broadcom/brcm80211/brcmfmac/flowring.h    |  2 +-
> 2 files changed, 3 insertions(+), 9 deletions(-)



