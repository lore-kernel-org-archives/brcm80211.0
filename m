Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714373;
	b=fgTizsOHRf7oI6Tkg2sehTdeXt/WHwLxRgVWgLlMcf8PWPH32Nd5AQbq24npu1GlNQWe
	 dsxcN3cO0k4RHtsRHJDpDSOz+849HOA9Ib/8oacJeI/SrSpAjQ9Qym8WUwcpxtjAGZzow
	 qe35WK/xqr+/l0VG5C30nWOy1CCRNkXzlLoZ9DahwB332cg46X3Aw6OPrZsNSX0lZ9pdj
	 O5E43gHner5nNArJhywvzjTx5ubqMXjfjLsRdU+1hzDMUhO5/B7pKrW0ffPum/8wQtxy0
	 o8AhJfpQ4zuQwzUnxGUgBzzJHuwC+WMy6AcJUcm2A5+R1z86NYRIEwA4D6fJEPOxBYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714373;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Qngkg57Ni1YhWMlAtKTzwfofY3KWH3EsG38ilqqk6Gk=;
	b=sofgnUR+5p2h27lq3/6J6BZElZmvjp15/qMQBj3DN/g9bwfTz7IdDaEoVUYdq595iNTd
	 qXxPZkrA6rVMyxvF4v7pAlqI9hH7jOBv/hPqmGJZ7B2+f1ljHvc+hjcp16fAVaj6K+h8B
	 lDdhptE5n30bC2aRSOq8JVUVdMPQiYVKnLR8veRX6gWCR01rWmFwqhFUFmlzSmyO0aF8F
	 zEqjN8hww8amq3J/S90tE3mram1mQhHmTyiw8y4zT/FTNAp58go/nbOX3O2vJR9fvVyC9
	 8e/DfgQE8UMWBRwYS2uf319HxbKu7pY86hRNbXxb9k7hsAOQjVLknDCBvH9Nx23SuyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ua6IR3L8;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FC4606EE9F
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0FC4606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ua6IR3L8
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso1911992a91.2
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714372; x=1794319172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qngkg57Ni1YhWMlAtKTzwfofY3KWH3EsG38ilqqk6Gk=;
        b=M42TVGojdJqd9DMgWYhMO/z9wdz+TPlzOjLCmnSLtmXF6ZRqF7Q8f7xMDFFbbbydlv
         ASCogdmryv5QBxSKANy44hTI1PyEQI+28U/iWPSMOFZUjS11jtqNdHeCKMRvcvWhK1dL
         1qW2akE4MUduG2MHztcuBM1KSscJM9JfmyhIs6wcbMxm+Z48I3Yk4fUh9ZAR7J1P9UL2
         sc36qG5jYddE7EufPOkaXQEZMtN4AvvLZOnIkDuMvNX/c4mVzaOfsrdGLu9OC5xwm52P
         awE0tX3z3CGNigg0tTQSDnj81rN0NbWZwgU0OHT/qpVlbQcq3poUj3vDoEd0GRrHdSF4
         jFxw==
X-Forwarded-Encrypted: i=1; AKwUvBx84zg5oZH+VWf4JKNMdjQcNtRwQkwFmPC3O/YeK4F5wb/jNebcZFsnhhLbiXw6lUF9fpdFCkSselQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/wzKKRpQaTyDVTHNvbZOuuqLqoZVL3LS6UWqAbOLHVFVvY+aE4
	W26Oko99kuzsAcWc+WHh55nfxv+QF5rLtTvzPF+j/YL7eRjFGNPX8ppHjxl8VnOWzJHf5oAzAM2
	iuuIS4X1FtUC7SHsty6Apu15haPtzbAOkcwrYDut5MXks22iVfP9n7iv7VqbuGujnyCDb6GQx1Q
	3Zi395K/islXBQIiqJ/EG0wOvtqK7dqvngp6zDJ0lSKW6MxfBI2HhWmVGTrTlwj6INgRjoeRLuJ
	+zMpSGHJfXlGQXYCToa1A==
X-Gm-Gg: AYBFou3YMtIc8+Wxl3hUnB3c3aPXOMK+n/6pf+j3EM3XrFAwaUQEaKDHkjPYO84pp8q
	bFK+Y/GP39nqqWAoveaALYdf+zxX9RWA16ApxMinROVzAvi/ShpMjxPqfwYVCxMnVF8eCGf31jH
	i7bExPaTpsYSBaxTTfol/52b6AocWMe6yuKWGZEw3y+9WS1IarvuKB4iZ6+rLTI6g96sB/Y4jcr
	uBbOf3Y1LEYdD/6yM8BUL91QRVjrirRdB2PmnU7YF2ZAIrG8TrC6wXxb/0wLWCKUWrFcyh67hVI
	WYP9QapnXUinTv7/igfRgKlNsrOHeqoPuhy/JGIT+wZ+7PYJoUilexEHUvtygEDZyqqb+z+IBml
	B80UrASmZlfJoYW0VZmCRW3MNdCZAGnx/EKU6PztHeexXbpqma+X99wy9Ki2eGfzpZ8g48nm7WT
	uAhngAvpehv1wsRH9u7e1dsekNs4fL9u9LGDzePl8=
X-Received: by 2002:a17:90b:33cb:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3ae8973643cmr9042739a91.23.1793714372021;
        Tue, 03 Nov 2026 05:59:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae881d509fsm4794589a91.5.2026.11.03.05.59.31
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so3930738c88.0
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714370; x=1794319170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qngkg57Ni1YhWMlAtKTzwfofY3KWH3EsG38ilqqk6Gk=;
        b=Ua6IR3L8JdicxNhU6mpNPVnUhF9OAlSfiM8lP4UGi771rI2nHy8ZqgjJ8C2pnfXflv
         ODTIg+4Mn23XGzLBQYi/jfg0Hfi+6LAhp+tObq4ufreoCVz1TRWT3oU9dQq3H0zkRpej
         9nccermfKsdaULGlLp8yzu/nUrd1bVLd6vO/k=
X-Forwarded-Encrypted: i=1; AKwUvByIioUkAsb6lJxAD3Hw47jmElog/amcEPzzk0upWFTvTY0lF80pFr1ylBk2nfJ0fJwqznTdaXdNIh0=@lists.linux.dev
X-Received: by 2002:a05:7022:ec85:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1ac59dd081cmr26545082c88.13.1793714370055;
        Tue, 03 Nov 2026 05:59:30 -0800 (PST)
X-Received: by 2002:a05:7022:ec85:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1ac59dd081cmr26544986c88.13.1793714368146;
        Tue, 03 Nov 2026 05:59:28 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:27 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 09/13] wifi: brcmfmac: Accept newer BSS information versions
Date: Tue,  3 Nov 2026 14:58:49 +0100
Message-ID: <20261103135856.3676311-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-9-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-9-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:44 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> The driver accepts only BSS information version 109, rejecting scan
> results with newer versions even though the common fields used for
> reporting remain compatible.
>
> Accept versions 109 through 112 when reporting scan results.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c   | 5 +++--
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h | 3 ++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
