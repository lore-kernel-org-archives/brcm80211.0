Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94958F54
	for <brcm80211@lists.linux.dev>; Tue,  1 Apr 2025 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526672; cv=none; b=G5wtMacl1IyGp0GHZ2vpnAAVkvqMKe0DyCFACOMaRlqKyoXLmYNFk8jcYcXGSM1lDqESq6QYKfc+j9/jDX84pdc+axWqF+7BJa4kFWVK/zCAaCNJVQqEeQe9kfYCjKGKnoR0pnFIs+6P/PEZQE/Ra5i2DzSKdJ3hrkw/nGhw69I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526672; c=relaxed/simple;
	bh=F0V2cxyptzlCagkPfeXyVKb1UCEuS/E5+mcuEtZlLrw=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=F20oKIuCpgy3r6o58wuU0E1Q/khWvVSzDSatg99ZCj3zKTJdJgzn9hQa7yDCGmKL4NM0veMFvLu+ifXMZxnZcHOWVbNq+qAEAj4mRHhUrMQSBv56C7JnQi8lgo305mvs88oKLlaTC1+Nl2ARPFPuBA+ersGkebRdqWQNKEgjBJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UHdZ6wGn; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UHdZ6wGn"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3ff0df81fdbso1403912b6e.3
        for <brcm80211@lists.linux.dev>; Tue, 01 Apr 2025 09:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743526669; x=1744131469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vq1eST4XdAuqIXqauWM348TcT38DynoDIrbdBB+uK9Y=;
        b=UHdZ6wGnBcp3YV4BOqHyq5vYoXMpMS8MH5EO0DZZePEqQy8/EHX91goRHlOBrpTXE8
         /6GsU6DgtBLqWqphAtiRGHhdf0c//EHcmhVbgPgQFSYxHxn6FVotuKZIefsiUIO4Yj0f
         yXXZ3XEQa8nvisd7FOHXEaAC1769jt7uTJtuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526669; x=1744131469;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vq1eST4XdAuqIXqauWM348TcT38DynoDIrbdBB+uK9Y=;
        b=uG30VrAc0nDeYYsU1ERDhnaH3UWeZSF1rKRJaTEnSvjsMr99RNdCtdlqTuVCmYCxs0
         M1gCT5WLc7ZahJHMX/8vLeEJxpljJxStRk20hOY1rbgQak284S8pwwvHDc8SUkjjsYDH
         tArVQX1k3FfSc9DqqPL3stnUWSkTewboYJ2GzNxh4rOJDgGAI+DucvliCnQMNZzwgwex
         QbkQZJO94thQLcKflBVoAx/Cpv9E09cCNFB23dx/ZJw6pnhQ+EW/1TAqqST0efU7PPGY
         2fseOgoQWmEjTY1TP2FYDZt0ZsQrf2CTKQkLrsVIPuA80Axh53V9LWOus/x4aiNFvSX+
         cJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmHi/YyjWq4GFAcyLt7Z4HKebxPoM22kQkm/99zn12l0BBOGXYsSl+feLEJ4aBiB0nzOOPN8kcYnM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEtNoX2ENrzmp+6pwCCPKk5xbVlZalgUIZxJNgN0fUJSwyo+Ud
	d/lFSQDvwjB/sWILZUmgijFhtJ5g1xswsdoy2njSf0ngUe1+jjjaJmk7IXZShQ==
X-Gm-Gg: ASbGncsU1aXde6vnUJ6M1DY1pWCz0jutYwCZERYp1MG5B5J0ohaLS9l5Z8d8Mta3f2G
	34SxQsZmqsv3ETt2erSEXqJ5J8xR5oCGFWach2ykNznD8124b8c7QDNitHiGxlyeN717ZrYhdb/
	70PQJRBAKo12id3g32UZdlucPvzw5gFwAdakwQ6nqY3PX11wE9pjD3ZXmWDoRZKUiEUPq0AqOVv
	u+ZdM3aqAcDh3Z6hClwdd2dvdr4sCX+FoNmTXXBgxU1h56ztz9IXWKcTy7I9MfIlHBSbu9x3TII
	YATJHpImZyMHQNxb2Bv8/AtzZFJm9bwcxiwpolje/g3Br4KHnwOb2p+rk8RFtFHT6fPu3EkReYn
	N0C3MkPQ=
X-Google-Smtp-Source: AGHT+IGBx1noyN3TJ313n9Kthyl/Yjyce+VVSvoH/kFWvJU9RS3mJIOp7wnfQiVem0qSyin3ne6N0w==
X-Received: by 2002:a05:6808:3448:b0:3fa:39cc:3be9 with SMTP id 5614622812f47-3ff0f4eb1a7mr9016782b6e.2.1743526668749;
        Tue, 01 Apr 2025 09:57:48 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff05278de3sm2002721b6e.36.2025.04.01.09.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:57:47 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Tue, 01 Apr 2025 18:57:42 +0200
Message-ID: <195f2498f70.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250401140924.29168-1-bsdhenrymartin@gmail.com>
References: <20250401140924.29168-1-bsdhenrymartin@gmail.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH v1] wifi: brcmfmac: acpi: Add NULL check in brcmf_acpi_probe()
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 1, 2025 4:09:36 PM Henry Martin <bsdhenrymartin@gmail.com> wrote:

> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> brcmf_acpi_probe() does not check for this case, which results in a NULL
> pointer dereference.
>
> Add NULL check after devm_kasprintf() to prevent this issue.
>
> Fixes: 0f485805d008 ("wifi: brcmfmac: acpi: Add support for fetching Apple 
> ACPI properties")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/acpi.c | 2 ++
> 1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/acpi.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/acpi.c
> index c4a54861bfb4..4885d5d0a0af 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/acpi.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/acpi.c
> @@ -25,6 +25,8 @@ void brcmf_acpi_probe(struct device *dev, enum 
> brcmf_bus_type bus_type,
>  settings->board_type = devm_kasprintf(dev, GFP_KERNEL,
>       "apple,%s",
>       o->string.pointer);
> + if (!settings->board_type)
> + return -ENOMEM;

brcmf_acpi_probe() has void return type so this would give a compiler 
warning. I expect submitted patches at least do pass compilation.

After digging through the driver code I see a null check everywhere it is 
used. Can you please provide a kernel log with a null deref so I may have a 
clue where it goes wrong? If any.

Regards,
Arend
>



