Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C8D2572
	for <brcm80211@lists.linux.dev>; Fri,  1 Mar 2024 00:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709253639; cv=none; b=WyqmlQlzxGsBZYerg4atN7TQRa4NJyZZnr+dvSuXPTwLSht2+zs22ZIk3xQyNeq98en8rz4wigIxUp1PruCvIwR39t6WAW7MDBG2QQPOV8W3v6oro5RpAkzyegDTgnRlkAHGRw5fspMs8LQPJcFHGjXebHcBiIue+AWUX3VIktk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709253639; c=relaxed/simple;
	bh=muLgGupmanQwoOkaJ46uTZdhMTCwpFMyxV8hvto3RLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3BXjRj/ylZmZiOAT1St/Y1YoZBmedOqztIrRWCQc3F87RvUikzm9BVxAuLz2D/MuOpdBiKa/O+g3+tuNngPY1kQdChMx0KZX90zWIdmFjo+ER44AyK9zsPtitzNChgYw6iOOFIxJmSd6ZXdlA+NCNnKRlk3AAFwTkPXWuIRJhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PrWG+eTg; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PrWG+eTg"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e558a67f70so1558606b3a.0
        for <brcm80211@lists.linux.dev>; Thu, 29 Feb 2024 16:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709253637; x=1709858437; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uLux+aUHo/V4i5EAKecz3RknuLa58zL1C1hJWsd2v88=;
        b=PrWG+eTgy23KR2l+vtH0Bba1O1rr/XuxQ9SF/TdRazLkrikRaaN5yFR2CTyxQKRVrX
         oUEVnyx4XKTxPXMOWV5JGX+RsvU2QzfAlRAUiApVQ9rF67+MigDlj68vv1TEXEm1ak+/
         QNNdZb7LSWOc2zODvSQnjWEe2n8ouwxI4hGbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709253637; x=1709858437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLux+aUHo/V4i5EAKecz3RknuLa58zL1C1hJWsd2v88=;
        b=kyn5tz5ahRx1Y5k+gCX4P43/pdpXk8+JGRCqDzwG/Wo4HfmAhcaT7FxQBhP4OyFEtB
         DQatRpLbbCFOsIYMWe1YXPemBhnhWBkLp2JrU6PSLZcCXaicKyjdrtqDggS/RzWozyxE
         /PcM6y9iBu5oWoYzh4PNQbCgQj0AH4ST/METc7rxWw2h0uBwvpUALdU/CIbhrkWk4gIw
         efMrmog1sYwlU/4qZkUpA5bgZMKj5aZgvrA/ZEIjwBanrMy5eQHFUmxRleOqpW4qjHg0
         JIBhDOO9RGGZ5f5Jo+F/96gbSBuIelN/K0bF9T9pxdJ9J6eQDABtfzpe4H3m7PlqQ5Aq
         ekzA==
X-Forwarded-Encrypted: i=1; AJvYcCWbNLBY4Jey1QwsK6NOTcT3dOLCYoqTnNzb5bpkf94Wbr9YIQCULZLs4/ApTTYBRyO0k3WvxQHhVeYgMiGpoxBAfiV1w8UXi9M3
X-Gm-Message-State: AOJu0YycWr8jOVvIT2qqV7GPzjXhszQoE2+gw2/zrH1NBmInjEuobVn+
	81X0/ED04E8UNIlsklRUiYhd+sjX1cqeLw41E+3A6JLZe9VVbopoQhZiC9QfKA==
X-Google-Smtp-Source: AGHT+IHFUeR1ugKofHFnvWfCfO87r1lfl6kXIYM4J/RlEeAi/4GNXDb6FENvl1zIyk1SVIFJGbZskA==
X-Received: by 2002:a05:6a20:1582:b0:1a0:d57b:1c93 with SMTP id h2-20020a056a20158200b001a0d57b1c93mr50622pzj.33.1709253637593;
        Thu, 29 Feb 2024 16:40:37 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090ad60800b00296a23e407csm4249537pju.7.2024.02.29.16.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 16:40:37 -0800 (PST)
Date: Thu, 29 Feb 2024 16:40:36 -0800
From: Kees Cook <keescook@chromium.org>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-kernel@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev, linux-wireless@vger.kernel.org,
	justinstitt@google.com, quic_alokad@quicinc.com,
	jisoo.jang@yonsei.ac.kr, petr.tesarik.ext@huawei.com,
	hdegoede@redhat.com, johannes.berg@intel.com, kvalo@kernel.org,
	arend.vanspriel@broadcom.com
Subject: Re: [PATCH v3] wifi: brcm80211: handle pmk_op allocation failure
Message-ID: <202402291640.9AAD719D3@keescook>
References: <20240229103153.18533-1-duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229103153.18533-1-duoming@zju.edu.cn>

On Thu, Feb 29, 2024 at 06:31:53PM +0800, Duoming Zhou wrote:
> The kzalloc() in brcmf_pmksa_v3_op() will return null if the
> physical memory has run out. As a result, if we dereference
> the null value, the null pointer dereference bug will happen.
> 
> Return -ENOMEM from brcmf_pmksa_v3_op() if kzalloc() fails
> for pmk_op.
> 
> Fixes: a96202acaea4 ("wifi: brcmfmac: cfg80211: Add support for PMKID_V3 operations")
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>

Thanks for the respin! :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
