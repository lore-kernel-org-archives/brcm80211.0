Received: from mail-oa1-f98.google.com (mail-oa1-f98.google.com [209.85.160.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC05D3515CB
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 19:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785093665; cv=none; b=coLyLa7WPNndBY2zRaUXik5nqAHBNa0edjkCKUPCo/sHGYWcntTSRqa2u9lqGLR6K07P50ob6hsd1yutJQhiAFnAMyv+1E+uojEgHD6pGLxfcTiCUG/EdY5t4iARdW1n6qNkoAZRZYFFaj+mX0vA89jGMqv7nCXa0qUEaB4n4ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785093665; c=relaxed/simple;
	bh=fyLOzs4S/leSr8Df5qHayjyTwwiwPthIuUyGjrAo7uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8mcUmvdHwEJB+JcDgzCLkfFqWjYgVT6EluV5T8hGx7L1BLQAtZx239JYjUrNF42V65plceuZOn31jTIsHrrl9KGC/H+nOVfDFhXhORSx0VuXIjhZC+o7zfM/Dl2BCeI8lJ3aG0IH2vlpXPTrmWXmRx2V7kqBxqbeM8dhyg37dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UJK7V6hz; arc=none smtp.client-ip=209.85.160.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UJK7V6hz"
Received: by mail-oa1-f98.google.com with SMTP id 586e51a60fabf-448b89f700fso1856946fac.2
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785093663; x=1785698463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=f/GC7/JY8dkQF9VYMmOxneNdfen5EFzs8r5WpvRe5Po=;
        b=Tau6HLXkb59SXturAlKB2H+w3RyXRpiL2XxYiffAxaCLXuIZYeRBKJMjOFv7kWSB1x
         bfLJHbzgh7JYk+O3/doRka+QQo6+K2anpHQgO1yortqDuC6KHuba5SHfZfFb3cUe5EfT
         +I24Rn0j/Ah8Fk2qSC0iSs+PBrbaL6WnC8s/Tp42P8gPxQx7VdCm5rEUhs3tJXnHKgRM
         TrAw+aL0f+RpHcuq6+KR1liHiY0blyn65YAonD20CAU7mH4osy0MxxS+4OENQdTp4b4D
         EHTD7ZVTBIM8TEIfOK3PmMlPrFYsTzPgtRtrN0ljQT9FFSxp/0Ac7sGC9GUxdkIrI5KL
         4cUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQXyrpKUYPjljGCLIhXjQgwuvVTfW+blWVDNSyAnOCcUbR4/BGaq8OGTApfDaTxFLciEMFIav2wqc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQKpx0twMMi2GgzBmER8RIW8NmiwiafkhQRhkLOIwLQJOzquft
	ZpXXR5gCMVUoV5lMP9nvEY0YAoFkD2kjYDMbSpvih0RBADXfjdkaB9kSifzwXIuqWEfJImxjVfj
	CEkKp4CBO3HefRiAXimkr7l5wPHWIkzWTbSbGv9DVDCjZXx4uCfoLIYtLfqEplxLc/dJT5nKMnm
	YFFAGYLzoLmfpvw36OZkL/+w/G/7yMR4JNIbwcDTifEtSGcZxmNjC+57f+rufaN/9ymcXe/n612
	qLEXnvq0LhDIeb9ScBELg==
X-Gm-Gg: AR+sD12bDKWkvIlguxEnL8qLKi+1H9xa91diQ1SCwxiuNkps4QMgb4LlLMhT/LEsvm0
	7pCrJwXkoSz/5aLcG77C/G2kQeVLNwD3je8nVWUjTela3F5AXDdZEaNUMKK1VDHOswlYc78A5Og
	EgB6Mu394JdAi6eZ38Hi6woZKc5Xp2guoM06yEflE8w0QYK/Dp4Eqqr7FjnQDlbbnTMsH8BLVJD
	eLsQTbK6EAqtv4JcNBjydpqduYu4CdZQwBkYaDBosCIj+OkdpfdC2WfItJUbwgfMr/9K9WkPVDK
	mgEfJCi1a7+AgNmvKyorRAEX+vfd+55zmdCdgUjNvpcunvXj+sEz8zeikW6bqI0AeEyEE9Y9slK
	2ho7B3fkaQF3lasNGyi8GOtN9ppDc8N7ibsqY9eVHO8Knwki1V8a0aIMx3ehV7v7wh0B+swogKd
	YlP7rcmDE/iDqEhvXyCRKt7c0cT07I9z6OnK9EsE8=
X-Received: by 2002:a05:6870:3049:b0:447:a201:4a5a with SMTP id 586e51a60fabf-457f23bc71dmr4936149fac.8.1785093662693;
        Sun, 26 Jul 2026 12:21:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-457dddfd908sm685849fac.15.2026.07.26.12.21.01
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:21:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso3279940a12.0
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785093660; x=1785698460; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/GC7/JY8dkQF9VYMmOxneNdfen5EFzs8r5WpvRe5Po=;
        b=UJK7V6hzdfhBC6r2BTJnZgM6Y//ZLy/GKxmwivVUslpQFJO4xhj5s2ti+jz7Ux5teG
         BVy9WjrAWezba6atox74vEmkL883gUp49N874gVKDzD1eNLuLuaQBy5XemzcFPfzXT4P
         vEe3g/LZkilK60Amlla4LK3Bg0NAHr87Sm5Pg=
X-Forwarded-Encrypted: i=1; AHgh+Rocj/KZGYQHZa+DWcIMLfsZeJHN9oZzyMoUhc5JlApUs56m5COq67YP/NxWGVIgvtNivShXfPwpaoY=@lists.linux.dev
X-Received: by 2002:a05:6a21:6da8:b0:3bf:7c02:c46f with SMTP id adf61e73a8af0-3c67dae4388mr6673902637.14.1785093660090;
        Sun, 26 Jul 2026 12:21:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da8:b0:3bf:7c02:c46f with SMTP id adf61e73a8af0-3c67dae4388mr6673881637.14.1785093659625;
        Sun, 26 Jul 2026 12:20:59 -0700 (PDT)
Received: from [10.229.42.29] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13015052sm43706517c88.5.2026.07.26.12.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:20:59 -0700 (PDT)
Message-ID: <9ca181db-7bec-4f6c-9f42-4a66068af354@broadcom.com>
Date: Sun, 26 Jul 2026 21:20:52 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: brcmfmac: cyw: set a unique cookie for mgmt tx
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260725014411.170340-1-bogdan.nicolae@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260725014411.170340-1-bogdan.nicolae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 25/07/2026 03:44, Bogdan Nicolae wrote:
> Set cookie using an increasing atomic counter. Avoids mismatches of completion
> events later in brcmf_notify_mgmt_tx_status, where packet_id != vif->mgmt_tx_id
> is checked.

Thanks for the split. I increased the scope and been looking in the 
cookie usage in the wireless subsystem. So I have a series lined up to 
change the cookie to an input parameter and have cfg80211 hand out the 
cookie value (it already has cfg80211_assign_cookie() function). This
will also cover zero cookie fix here. So I would suggest to drop this 
patch and only let the PMKID patch go in.

Regards,
Arend
