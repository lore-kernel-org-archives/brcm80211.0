Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8802D1468FE
	for <brcm80211@lists.linux.dev>; Fri, 16 Feb 2024 21:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708119753; cv=none; b=T69teZsK1iABlP96rxunxffofGhSdDlHbOsFe5JoPgqWhpGd5SxM7G1+PVpQLUbJfiVdeKbz2spmw1HN09d51O7rxYiPy2CPbk0FgP7gCyLLqtNlN8KB4rruBrW5Tb9pt7+1lkaDHgM2rQIXDudkBVbLew/SMXbo8Tiuf0Zbsr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708119753; c=relaxed/simple;
	bh=4c3eMKTWbi+wcF5n+RJsW+tkHhjsCNbcJlVT2UgwhH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/noHfbefNTjKhkPMG3mKEr/+AJVd54ftQxS8CozDlMeEuG9nMmxsew+sYB1+m1AoKe4SSo4qMnLX0xmDBU/DzXJ900rtS6OdMcuGrqj56mlYHU3t8BBkpFWmZCt4PxJGu/9IWNf9mQ21c8Rlyk9jGzGpWIhCDDYqSGo+OH5ps4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fvf4EMZP; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fvf4EMZP"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e0fc87fc2dso1639775b3a.3
        for <brcm80211@lists.linux.dev>; Fri, 16 Feb 2024 13:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708119751; x=1708724551; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pmqvLalSTvjyY0hPo1vwRpJX0mbABPaN9LQ6zaR4OAw=;
        b=fvf4EMZPRiLY0gv4Hr4RFQu1QZcUHOpsoZ2E2KbAAgqO5nE2mDuaceRAQg5DsXGUCl
         msK1xAPpH+Zu89JwJVA/759j/JLS7rJ3BINPHRK7WKjmpDIOe7qWkg/41WmtUoQtfLZV
         a46f+lpH0fCHA7NFyCaTsMOyxpCo3AKQcwh64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708119751; x=1708724551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmqvLalSTvjyY0hPo1vwRpJX0mbABPaN9LQ6zaR4OAw=;
        b=emv6Te+ACh5e1XGmhOrxytpqeJfHj7HFwiJbRHSVaFenueYzpyYbEPRz2k+fENOndu
         NnNST3FakB12P5KR4YoL6C6GGBzCVWr2epURUYMSCJ6toXXeS9GHSm8BVv8f7i2x5JJW
         ptWqhAQt79dfYTnV+xcf8zPGR6V4Sx6yalYN6hCN19ZQlksxFF7DvUf/8ck1Rbxw47hx
         IB9iQQk0a9rJQTOYqmFE+nTX5/fAIGkkoz9sNFD+WQirODxJ/8yqLtdcdw+VaBCBdtxQ
         1cpNEzLPA42mqM+EfcwSOC2OlPbdGhj1iSO0s9BhsJyj7PCr3DLiHkM3K2Q1u/8VBBb+
         2cHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfBEx0eVfkuIQZHb1K+KtJIDt6m49rHbxEiulVs+YJpB7FKHvgHynkoEh2FXWLAPs+8mQnn+lMcCNm+N3jaQrjAfposa29bumY
X-Gm-Message-State: AOJu0YyHIyCdEC3082pwipMVSoFeTbDfqfzD46DsCgYFb4CqhZzPpfQT
	/He99HWP8hZNd3iloK1Agjl+6c0vllUplg5PxIutwOspI8eCj5nheLGfBQsnrw==
X-Google-Smtp-Source: AGHT+IEXIq2vlhY0MRi3dbghbU5hzq6K5TiA/bjopoX0NzcTaYWwUJfK3zWU4HYBShZXvZGvCuUPfg==
X-Received: by 2002:a17:90a:b902:b0:299:24ae:7ed9 with SMTP id p2-20020a17090ab90200b0029924ae7ed9mr5316353pjr.36.1708119750822;
        Fri, 16 Feb 2024 13:42:30 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id cz15-20020a17090ad44f00b0029703476e9bsm453747pjb.44.2024.02.16.13.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 13:42:30 -0800 (PST)
Date: Fri, 16 Feb 2024 13:42:29 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] wifi: brcmfmac: fweh: Fix boot crash on Raspberry
 Pi 4
Message-ID: <202402161341.AC45AC7@keescook>
References: <Zc+3PFCUvLoVlpg8@neat>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zc+3PFCUvLoVlpg8@neat>

On Fri, Feb 16, 2024 at 01:27:56PM -0600, Gustavo A. R. Silva wrote:
> Fix boot crash on Raspberry Pi by moving the update to `event->datalen`
> before data is copied into flexible-array member `data` via `memcpy()`.
> 
> Flexible-array member `data` was annotated with `__counted_by(datalen)`
> in commit 62d19b358088 ("wifi: brcmfmac: fweh: Add __counted_by for
> struct brcmf_fweh_queue_item and use struct_size()"). The intention of
> this is to gain visibility into the size of `data` at run-time through
> its _counter_ (in this case `datalen`), and with this have its accesses
> bounds-checked at run-time via CONFIG_FORTIFY_SOURCE and
> CONFIG_UBSAN_BOUNDS.
> 
> To effectively accomplish the above, we shall update the counter
> (`datalen`), before the first access to the flexible array (`data`),
> which was also done in the mentioned commit.
> 
> However, commit edec42821911 ("wifi: brcmfmac: allow per-vendor event
> handling") inadvertently caused a buffer overflow, detected by
> FORTIFY_SOURCE. It moved the `event->datalen = datalen;` update to after
> the first `data` access, at which point `event->datalen` was not yet
> updated from zero (after calling `kzalloc()`), leading to the overflow
> issue.
> 
> This fix repositions the `event->datalen = datalen;` update before
> accessing `data`, restoring the intended buffer overflow protection. :)
> 
> Fixes: edec42821911 ("wifi: brcmfmac: allow per-vendor event handling")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://gist.github.com/nathanchance/e22f681f3bfc467f15cdf6605021aaa6
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Yup, this looks correct. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
